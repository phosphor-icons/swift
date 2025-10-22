//
//  SVGRasterizer.swift
//  Phosphor Icons
//
//  Created by Phosphor Contributors.
//

import Foundation
import CoreGraphics
import CoreText

/// Converts parsed SVG data into rasterized CGImage for display
/// Optimized for Phosphor icon characteristics and common use cases
public enum SVGRasterizer {
    
    /// Rasterize SVG data to a CGImage at specified size
    /// - Parameters:
    ///   - svgData: Parsed SVG data to render
    ///   - size: Target size for the output image
    /// - Returns: Rasterized CGImage or nil if rendering fails
    public static func rasterize(_ svgData: SVGData, to size: CGSize) -> CGImage? {
        
        // Create graphics context
        guard let context = createGraphicsContext(size: size) else {
            return nil
        }
        
        // Calculate scale transform from viewBox to target size
        let scaleX = size.width / svgData.viewBox.width
        let scaleY = size.height / svgData.viewBox.height
        let scale = min(scaleX, scaleY) // Maintain aspect ratio
        
        // Center the scaled content
        let scaledSize = CGSize(
            width: svgData.viewBox.width * scale,
            height: svgData.viewBox.height * scale
        )
        let offsetX = (size.width - scaledSize.width) / 2
        let offsetY = (size.height - scaledSize.height) / 2
        
        // Apply transforms
        context.translateBy(x: offsetX, y: size.height - offsetY)
        context.scaleBy(x: scale, y: -scale) // Flip Y-axis for SVG coordinate system
        context.translateBy(x: -svgData.viewBox.origin.x, y: -svgData.viewBox.origin.y)
        
        // Render each path
        for path in svgData.paths {
            renderPath(path, in: context)
        }
        
        return context.makeImage()
    }
    
    /// Create optimized graphics context for icon rendering
    private static func createGraphicsContext(size: CGSize) -> CGContext? {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue
        
        return CGContext(
            data: nil,
            width: Int(size.width),
            height: Int(size.height),
            bitsPerComponent: 8,
            bytesPerRow: 0,
            space: colorSpace,
            bitmapInfo: bitmapInfo
        )
    }
    
    /// Render a single SVG path in the graphics context
    private static func renderPath(_ svgPath: SVGPath, in context: CGContext) {
        
        guard let cgPath = createCGPath(from: svgPath.pathData) else {
            return
        }
        
        // Apply fill if specified
        if let fill = svgPath.fill, !isNone(fill) {
            let alpha = effectiveAlpha(base: svgPath.opacity, component: svgPath.fillOpacity)
            if alpha > 0 {
                context.saveGState()
                context.addPath(cgPath)
                context.setFillColor(colorFromString(fill, alpha: alpha))
                let mode: CGPathDrawingMode = svgPath.fillRule?.lowercased() == "evenodd" ? .eoFill : .fill
                context.drawPath(using: mode)
                context.restoreGState()
            }
        }
        
        // Apply stroke if specified
        if let stroke = svgPath.stroke, !isNone(stroke) {
            let alpha = effectiveAlpha(base: svgPath.opacity, component: svgPath.strokeOpacity)
            if alpha > 0 {
                context.saveGState()
                context.addPath(cgPath)
                context.setStrokeColor(colorFromString(stroke, alpha: alpha))
                context.setLineWidth(svgPath.strokeWidth ?? 1.5)
                context.setLineCap(.round)
                context.setLineJoin(.round)
                context.setMiterLimit(4.0)
                context.drawPath(using: .stroke)
                context.restoreGState()
            }
        }
    }
    
    /// Create CGPath from SVG path data string
    private static func createCGPath(from pathData: String) -> CGPath? {
        let path = CGMutablePath()
        let scanner = Scanner(string: pathData)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: " ,\n\t\r")

        var currentPoint = CGPoint.zero
        var subpathStartPoint = CGPoint.zero
        var lastCubicControl: CGPoint?
        var lastQuadraticControl: CGPoint?
        var currentCommand: Character?

        while !scanner.isAtEnd {
            if let nextCommand = nextCommand(in: scanner) {
                currentCommand = nextCommand
            } else if currentCommand == nil {
                break
            }

            guard let command = currentCommand else { break }

            switch command {
            case "M", "m":
                let isRelative = command == "m"
                guard let point = scanPoint(scanner, relativeTo: currentPoint, isRelative: isRelative) else { return nil }
                path.move(to: point)
                currentPoint = point
                subpathStartPoint = point
                lastCubicControl = nil
                lastQuadraticControl = nil

                while let nextPoint = scanPoint(scanner, relativeTo: currentPoint, isRelative: isRelative) {
                    path.addLine(to: nextPoint)
                    currentPoint = nextPoint
                }

                currentCommand = isRelative ? "l" : "L"

            case "L", "l":
                let isRelative = command == "l"
                while let point = scanPoint(scanner, relativeTo: currentPoint, isRelative: isRelative) {
                    path.addLine(to: point)
                    currentPoint = point
                }
                lastCubicControl = nil
                lastQuadraticControl = nil

            case "H", "h":
                let isRelative = command == "h"
                while let x = scanner.scanDouble() {
                    let newX = isRelative ? currentPoint.x + CGFloat(x) : CGFloat(x)
                    currentPoint = CGPoint(x: newX, y: currentPoint.y)
                    path.addLine(to: currentPoint)
                }
                lastCubicControl = nil
                lastQuadraticControl = nil

            case "V", "v":
                let isRelative = command == "v"
                while let y = scanner.scanDouble() {
                    let newY = isRelative ? currentPoint.y + CGFloat(y) : CGFloat(y)
                    currentPoint = CGPoint(x: currentPoint.x, y: newY)
                    path.addLine(to: currentPoint)
                }
                lastCubicControl = nil
                lastQuadraticControl = nil

            case "C", "c":
                let isRelative = command == "c"
                while true {
                    let start = currentPoint
                    guard let cp1 = scanPoint(scanner, relativeTo: start, isRelative: isRelative),
                          let cp2 = scanPoint(scanner, relativeTo: start, isRelative: isRelative),
                          let end = scanPoint(scanner, relativeTo: start, isRelative: isRelative) else { break }
                    path.addCurve(to: end, control1: cp1, control2: cp2)
                    currentPoint = end
                    lastCubicControl = cp2
                    lastQuadraticControl = nil
                }

            case "S", "s":
                let isRelative = command == "s"
                while true {
                    let start = currentPoint
                    guard let cp2 = scanPoint(scanner, relativeTo: start, isRelative: isRelative),
                          let end = scanPoint(scanner, relativeTo: start, isRelative: isRelative) else { break }
                    let reflected = lastCubicControl.map { reflect($0, over: start) } ?? start
                    path.addCurve(to: end, control1: reflected, control2: cp2)
                    currentPoint = end
                    lastCubicControl = cp2
                    lastQuadraticControl = nil
                }

            case "Q", "q":
                let isRelative = command == "q"
                while true {
                    let start = currentPoint
                    guard let control = scanPoint(scanner, relativeTo: start, isRelative: isRelative),
                          let end = scanPoint(scanner, relativeTo: start, isRelative: isRelative) else { break }
                    path.addQuadCurve(to: end, control: control)
                    currentPoint = end
                    lastQuadraticControl = control
                    lastCubicControl = nil
                }

            case "T", "t":
                let isRelative = command == "t"
                while true {
                    let start = currentPoint
                    guard let end = scanPoint(scanner, relativeTo: start, isRelative: isRelative) else { break }
                    let control = lastQuadraticControl.map { reflect($0, over: start) } ?? start
                    path.addQuadCurve(to: end, control: control)
                    currentPoint = end
                    lastQuadraticControl = control
                    lastCubicControl = nil
                }

            case "A", "a":
                let isRelative = command == "a"
                while true {
                    let start = currentPoint
                    guard let arc = scanArc(scanner, currentPoint: start, isRelative: isRelative) else { break }
                    addArc(path: path, currentPoint: &currentPoint, startPoint: start, arc: arc)
                    lastCubicControl = nil
                    lastQuadraticControl = nil
                }

            case "Z", "z":
                path.closeSubpath()
                currentPoint = subpathStartPoint
                lastCubicControl = nil
                lastQuadraticControl = nil

            default:
                break
            }
        }

        return path.copy()
    }

    private static func nextCommand(in scanner: Scanner) -> Character? {
        let string = scanner.string
        var index = scanner.currentIndex
        while index < string.endIndex {
            let character = string[index]
            if character.isLetter {
                scanner.currentIndex = string.index(after: index)
                return character
            }
            if character == "," || character.isWhitespace {
                index = string.index(after: index)
                continue
            }
            break
        }
        return nil
    }

    private static func scanPoint(_ scanner: Scanner, relativeTo base: CGPoint, isRelative: Bool) -> CGPoint? {
        guard let x = scanner.scanDouble(), let y = scanner.scanDouble() else {
            return nil
        }
        var point = CGPoint(x: CGFloat(x), y: CGFloat(y))
        if isRelative {
            point.x += base.x
            point.y += base.y
        }
        return point
    }

    private static func reflect(_ point: CGPoint, over reference: CGPoint) -> CGPoint {
        CGPoint(x: 2 * reference.x - point.x, y: 2 * reference.y - point.y)
    }

    private struct ArcParameters {
        let rx: CGFloat
        let ry: CGFloat
        let rotation: CGFloat
        let largeArc: Bool
        let sweep: Bool
        let endPoint: CGPoint
    }

    private static func scanArc(_ scanner: Scanner, currentPoint: CGPoint, isRelative: Bool) -> ArcParameters? {
        guard let rx = scanner.scanDouble(),
              let ry = scanner.scanDouble(),
              let rotation = scanner.scanDouble(),
              let largeArcFlag = scanner.scanDouble(),
              let sweepFlag = scanner.scanDouble(),
              let endPoint = scanPoint(scanner, relativeTo: currentPoint, isRelative: isRelative) else {
            return nil
        }
        return ArcParameters(
            rx: CGFloat(abs(rx)),
            ry: CGFloat(abs(ry)),
            rotation: CGFloat(rotation * .pi / 180.0),
            largeArc: largeArcFlag != 0,
            sweep: sweepFlag != 0,
            endPoint: endPoint
        )
    }

    /// Converts an SVG elliptical arc command into cubic Bézier segments and appends them to the path.
    private static func addArc(path: CGMutablePath,
                               currentPoint: inout CGPoint,
                               startPoint: CGPoint,
                               arc: ArcParameters) {
        var rx = arc.rx
        var ry = arc.ry
        let rotation = arc.rotation
        let endPoint = arc.endPoint

        if rx == 0 || ry == 0 || startPoint == endPoint {
            path.addLine(to: endPoint)
            currentPoint = endPoint
            return
        }

        let cosPhi = cos(rotation)
        let sinPhi = sin(rotation)
        let dx2 = (startPoint.x - endPoint.x) / 2.0
        let dy2 = (startPoint.y - endPoint.y) / 2.0

        let x1p = cosPhi * dx2 + sinPhi * dy2
        let y1p = -sinPhi * dx2 + cosPhi * dy2

        var rxSq = rx * rx
        var rySq = ry * ry
        let x1pSq = x1p * x1p
        let y1pSq = y1p * y1p

        let lambda = (x1pSq / rxSq) + (y1pSq / rySq)
        if lambda > 1 {
            let scale = sqrt(lambda)
            rx *= scale
            ry *= scale
            rxSq = rx * rx
            rySq = ry * ry
        }

        let numerator = max(0, rxSq * rySq - rxSq * y1pSq - rySq * x1pSq)
        let denominator = (rxSq * y1pSq) + (rySq * x1pSq)
        let factor = denominator == 0 ? 0 : sqrt(numerator / denominator)
        let sign: CGFloat = (arc.largeArc == arc.sweep) ? -1 : 1

        let cxp = sign * factor * (rx * y1p) / ry
        let cyp = sign * -factor * (ry * x1p) / rx

        let cx = cosPhi * cxp - sinPhi * cyp + (startPoint.x + endPoint.x) / 2.0
        let cy = sinPhi * cxp + cosPhi * cyp + (startPoint.y + endPoint.y) / 2.0

        let startVector = CGPoint(x: (x1p - cxp) / rx, y: (y1p - cyp) / ry)
        let endVector = CGPoint(x: (-x1p - cxp) / rx, y: (-y1p - cyp) / ry)

        let startAngle = angleBetween(CGPoint(x: 1, y: 0), and: startVector)
        var deltaAngle = angleBetween(startVector, and: endVector)

        if !arc.sweep && deltaAngle > 0 {
            deltaAngle -= 2 * .pi
        } else if arc.sweep && deltaAngle < 0 {
            deltaAngle += 2 * .pi
        }

        let segments = max(Int(ceil(abs(deltaAngle) / (.pi / 2))), 1)
        let delta = deltaAngle / CGFloat(segments)

        for segment in 0..<segments {
            let theta1 = startAngle + CGFloat(segment) * delta
            let theta2 = theta1 + delta

            let t = (4.0 / 3.0) * tan((theta2 - theta1) / 4.0)

            let sinTheta1 = sin(theta1)
            let cosTheta1 = cos(theta1)
            let sinTheta2 = sin(theta2)
            let cosTheta2 = cos(theta2)

            let endpoint = pointOnEllipse(angle: theta2,
                                          rx: rx,
                                          ry: ry,
                                          cosPhi: cosPhi,
                                          sinPhi: sinPhi,
                                          centerX: cx,
                                          centerY: cy)

            let cp1Ellipse = CGPoint(
                x: rx * (cosTheta1 - t * sinTheta1),
                y: ry * (sinTheta1 + t * cosTheta1)
            )
            let cp2Ellipse = CGPoint(
                x: rx * (cosTheta2 + t * sinTheta2),
                y: ry * (sinTheta2 - t * cosTheta2)
            )

            let control1 = transformEllipsePoint(cp1Ellipse,
                                                 cosPhi: cosPhi,
                                                 sinPhi: sinPhi,
                                                 centerX: cx,
                                                 centerY: cy)
            let control2 = transformEllipsePoint(cp2Ellipse,
                                                 cosPhi: cosPhi,
                                                 sinPhi: sinPhi,
                                                 centerX: cx,
                                                 centerY: cy)

            path.addCurve(to: endpoint, control1: control1, control2: control2)
            currentPoint = endpoint
        }
    }

    private static func pointOnEllipse(angle: CGFloat,
                                        rx: CGFloat,
                                        ry: CGFloat,
                                        cosPhi: CGFloat,
                                        sinPhi: CGFloat,
                                        centerX: CGFloat,
                                        centerY: CGFloat) -> CGPoint {
        let x = rx * cos(angle)
        let y = ry * sin(angle)
        let transformedX = cosPhi * x - sinPhi * y + centerX
        let transformedY = sinPhi * x + cosPhi * y + centerY
        return CGPoint(x: transformedX, y: transformedY)
    }

    private static func transformEllipsePoint(_ point: CGPoint,
                                               cosPhi: CGFloat,
                                               sinPhi: CGFloat,
                                               centerX: CGFloat,
                                               centerY: CGFloat) -> CGPoint {
        CGPoint(
            x: cosPhi * point.x - sinPhi * point.y + centerX,
            y: sinPhi * point.x + cosPhi * point.y + centerY
        )
    }

    private static func angleBetween(_ u: CGPoint, and v: CGPoint) -> CGFloat {
        let dot = u.x * v.x + u.y * v.y
        let lengthProduct = hypot(u.x, u.y) * hypot(v.x, v.y)
        guard lengthProduct != 0 else { return 0 }
        let clamped = max(-1, min(1, dot / lengthProduct))
        let angle = acos(clamped)
        let cross = u.x * v.y - u.y * v.x
        return cross < 0 ? -angle : angle
    }
    
    /// Convert color string to CGColor
    private static func isNone(_ value: String) -> Bool {
        value.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() == "none"
    }

    private static func effectiveAlpha(base: Double?, component: Double?) -> CGFloat {
        let alpha = (base ?? 1.0) * (component ?? 1.0)
        return CGFloat(max(0, min(1, alpha)))
    }

    private static func colorFromString(_ colorString: String, alpha: CGFloat) -> CGColor {
        let trimmed = colorString.trimmingCharacters(in: .whitespacesAndNewlines)
        let lowercased = trimmed.lowercased()
        if lowercased == "currentcolor" {
            return CGColor(red: 0, green: 0, blue: 0, alpha: alpha)
        }
        if lowercased == "transparent" {
            return CGColor(red: 0, green: 0, blue: 0, alpha: 0)
        }
        if trimmed.hasPrefix("#") {
            return colorFromHex(trimmed, alpha: alpha)
        }
        if lowercased.hasPrefix("rgb") {
            return colorFromRGBFunction(lowercased, alpha: alpha)
        }
        return CGColor(red: 0, green: 0, blue: 0, alpha: alpha)
    }

    private static func colorFromHex(_ hexString: String, alpha: CGFloat) -> CGColor {
        let hex = String(hexString.dropFirst())
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a = alpha

        switch hex.count {
        case 3: // RGB
            r = component(from: hex, start: 0, length: 1)
            g = component(from: hex, start: 1, length: 1)
            b = component(from: hex, start: 2, length: 1)
        case 4: // RGBA
            r = component(from: hex, start: 0, length: 1)
            g = component(from: hex, start: 1, length: 1)
            b = component(from: hex, start: 2, length: 1)
            a *= component(from: hex, start: 3, length: 1)
        case 6: // RRGGBB
            r = component(from: hex, start: 0, length: 2)
            g = component(from: hex, start: 2, length: 2)
            b = component(from: hex, start: 4, length: 2)
        case 8: // RRGGBBAA
            r = component(from: hex, start: 0, length: 2)
            g = component(from: hex, start: 2, length: 2)
            b = component(from: hex, start: 4, length: 2)
            a *= component(from: hex, start: 6, length: 2)
        default:
            break
        }

        return CGColor(red: r, green: g, blue: b, alpha: a)
    }

    private static func component(from hex: String, start: Int, length: Int) -> CGFloat {
        let startIndex = hex.index(hex.startIndex, offsetBy: start)
        let endIndex = hex.index(startIndex, offsetBy: length)
        let substring = hex[startIndex..<endIndex]
        let string: String
        if length == 1 {
            let character = substring[substring.startIndex]
            string = String(repeating: String(character), count: 2)
        } else {
            string = String(substring)
        }
        let value = UInt64(string, radix: 16) ?? 0
        return CGFloat(value) / 255.0
    }

    private static func colorFromRGBFunction(_ string: String, alpha: CGFloat) -> CGColor {
        let start = string.index(after: string.firstIndex(of: "(") ?? string.startIndex)
        let end = string.firstIndex(of: ")") ?? string.endIndex
        let params = string[start..<end]
        let components = params.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
        guard components.count >= 3 else {
            return CGColor(red: 0, green: 0, blue: 0, alpha: alpha)
        }
        func parseComponent(_ value: String) -> CGFloat {
            if value.hasSuffix("%"), let percent = Double(value.dropLast()) {
                return CGFloat(percent / 100.0)
            }
            if let number = Double(value) {
                return CGFloat(number / 255.0)
            }
            return 0
        }
        let r = parseComponent(components[0])
        let g = parseComponent(components[1])
        let b = parseComponent(components[2])
        var a = alpha
        if components.count > 3, let alphaComponent = Double(components[3]) {
            a *= CGFloat(alphaComponent)
        }
        return CGColor(red: r, green: g, blue: b, alpha: a)
    }
}
