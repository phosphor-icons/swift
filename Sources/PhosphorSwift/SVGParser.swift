//
//  SVGParser.swift
//  Phosphor Icons
//
//  Created by Phosphor Contributors.
//

import Foundation
import CoreGraphics

/// Fast, focused SVG parser designed specifically for Phosphor icons
/// Optimized for the known structure and constraints of Phosphor SVG files
public enum SVGParser {
    
    /// Parse a Phosphor SVG string into structured data
    /// - Parameter svgString: Raw SVG content
    /// - Returns: Parsed SVG data or nil if parsing fails
    public static func parse(_ svgString: String) -> SVGData? {
        let defaults = extractDefaults(from: svgString)

        guard let viewBox = extractViewBox(from: svgString),
              let paths = extractPaths(from: svgString, defaults: defaults) else {
            return nil
        }

        return SVGData(viewBox: viewBox, paths: paths)
    }
    
    /// Extract viewBox dimensions from SVG
    private static func extractViewBox(from svgString: String) -> CGRect? {
        // Phosphor icons use standard viewBox="0 0 256 256"
        let viewBoxPattern = #"viewBox="([^"]+)""#
        
        guard let regex = try? NSRegularExpression(pattern: viewBoxPattern),
              let match = regex.firstMatch(in: svgString, range: NSRange(svgString.startIndex..., in: svgString)),
              let viewBoxRange = Range(match.range(at: 1), in: svgString) else {
            // Default fallback for Phosphor icons
            return CGRect(x: 0, y: 0, width: 256, height: 256)
        }
        
        let viewBoxValues = String(svgString[viewBoxRange])
            .split(separator: " ")
            .compactMap { Double($0) }
        
        guard viewBoxValues.count == 4 else {
            return CGRect(x: 0, y: 0, width: 256, height: 256)
        }
        
        return CGRect(
            x: viewBoxValues[0],
            y: viewBoxValues[1],
            width: viewBoxValues[2],
            height: viewBoxValues[3]
        )
    }
    
    /// Extract all path elements from SVG
    private static func extractPaths(from svgString: String, defaults: SVGDefaults) -> [SVGPath]? {
        // Match path elements with their attributes
        let pathPattern = #"<path[^>]*d="([^"]+)"[^>]*/?>"#

        guard let regex = try? NSRegularExpression(pattern: pathPattern, options: .caseInsensitive) else {
            return nil
        }
        
        let matches = regex.matches(in: svgString, range: NSRange(svgString.startIndex..., in: svgString))
        
        let paths: [SVGPath] = matches.compactMap { match in
            guard let pathRange = Range(match.range(at: 1), in: svgString) else {
                return nil
            }
            
            let pathData = String(svgString[pathRange])
            
            // Extract the full path element for attribute parsing
            guard let fullMatchRange = Range(match.range(at: 0), in: svgString) else {
                return SVGPath(pathData: pathData)
            }
            
            let fullPathElement = String(svgString[fullMatchRange])
            
            // Parse attributes from the path element
            let attributes = parsePathAttributes(from: fullPathElement)

            let fillValue = attributes["fill"] ?? defaults.fill
            let strokeValue = attributes["stroke"] ?? defaults.stroke
            let fillOpacity = attributes["fill-opacity"].flatMap { Double($0) }
            let strokeOpacity = attributes["stroke-opacity"].flatMap { Double($0) }
            let opacity = attributes["opacity"].flatMap { Double($0) }

            return SVGPath(
                pathData: pathData,
                fillRule: attributes["fill-rule"],
                strokeWidth: attributes["stroke-width"].flatMap { Double($0) },
                fill: fillValue,
                stroke: strokeValue,
                opacity: opacity,
                fillOpacity: fillOpacity,
                strokeOpacity: strokeOpacity
            )
        }

        return paths.isEmpty ? nil : paths
    }
    
    /// Parse attributes from a path element string
    private static func parsePathAttributes(from pathElement: String) -> [String: String] {
        var attributes: [String: String] = [:]
        
        // Common Phosphor SVG attributes
        let attributePatterns = [
            "fill": #"fill="([^"]+)""#,
            "stroke": #"stroke="([^"]+)""#,
            "stroke-width": #"stroke-width="([^"]+)""#,
            "fill-rule": #"fill-rule="([^"]+)""#,
            "opacity": #"opacity="([^"]+)""#,
            "fill-opacity": #"fill-opacity="([^"]+)""#,
            "stroke-opacity": #"stroke-opacity="([^"]+)""#
        ]
        
        for (attribute, pattern) in attributePatterns {
            if let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive),
               let match = regex.firstMatch(in: pathElement, range: NSRange(pathElement.startIndex..., in: pathElement)),
               let valueRange = Range(match.range(at: 1), in: pathElement) {
                attributes[attribute] = String(pathElement[valueRange])
            }
        }
        
        return attributes
    }
}

/// Represents default attributes inherited from the root SVG element
struct SVGDefaults {
    let fill: String?
    let stroke: String?
}

private extension SVGParser {
    static func extractDefaults(from svgString: String) -> SVGDefaults {
        let fillPattern = #"<svg[^>]*fill="([^"]+)""#
        let strokePattern = #"<svg[^>]*stroke="([^"]+)""#

        let fill = matchFirst(in: svgString, pattern: fillPattern)
        let stroke = matchFirst(in: svgString, pattern: strokePattern)

        return SVGDefaults(fill: fill, stroke: stroke)
    }

    static func matchFirst(in string: String, pattern: String) -> String? {
        guard let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive),
              let match = regex.firstMatch(in: string, range: NSRange(string.startIndex..., in: string)),
              let valueRange = Range(match.range(at: 1), in: string) else {
            return nil
        }
        return String(string[valueRange])
    }
}

/// Utility extensions for SVG parsing
extension SVGParser {
    
    /// Validates that an SVG string has the expected Phosphor format
    public static func isValidPhosphorSVG(_ svgString: String) -> Bool {
        // Basic validation checks
        return svgString.contains("<svg") &&
               svgString.contains("viewBox") &&
               svgString.contains("<path") &&
               svgString.contains("</svg>")
    }
    
    /// Extract SVG title/description if present (for accessibility)
    public static func extractTitle(from svgString: String) -> String? {
        let titlePattern = #"<title>([^<]+)</title>"#
        
        guard let regex = try? NSRegularExpression(pattern: titlePattern, options: .caseInsensitive),
              let match = regex.firstMatch(in: svgString, range: NSRange(svgString.startIndex..., in: svgString)),
              let titleRange = Range(match.range(at: 1), in: svgString) else {
            return nil
        }
        
        return String(svgString[titleRange])
    }
}
