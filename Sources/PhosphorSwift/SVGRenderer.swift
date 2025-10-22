//
//  SVGRenderer.swift
//  Phosphor Icons
//
//  Created by Phosphor Contributors.
//

import SwiftUI
import CoreGraphics
import Foundation
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// High-performance SVG renderer that generates icon weights dynamically
/// Replaces the massive bundle approach with on-demand rendering
public final class SVGRenderer {
    
    /// Thread-safe singleton instance for optimal performance
    public static let shared = SVGRenderer()
    
    /// Cache for parsed SVG data to avoid redundant XML parsing
    private let svgCache = NSCache<NSString, SVGData>()
    
    /// Cache for rendered images to avoid redundant drawing operations
    private let imageCache = NSCache<NSString, CGImage>()
    
    /// Concurrent queue for background SVG parsing and rendering
    private let renderQueue = DispatchQueue(label: "com.phosphor.svg-renderer", 
                                          qos: .userInitiated, 
                                          attributes: .concurrent)
    
    private init() {
        // Configure caches for optimal memory usage
        svgCache.countLimit = 200  // Reasonable limit for base SVGs
        imageCache.countLimit = 1000  // More generous for rendered variants
        
        // Clear caches on memory pressure
        #if canImport(UIKit)
        NotificationCenter.default.addObserver(
            forName: UIApplication.didReceiveMemoryWarningNotification,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.clearCaches()
        }
        #endif
    }
    
    /// Renders an icon with specified weight and size
    /// - Parameters:
    ///   - iconName: Base icon name (without weight suffix)
    ///   - weight: Visual weight to apply
    ///   - size: Target size for rendering
    ///   - color: Icon color (default: label color)
    /// - Returns: SwiftUI Image ready for display
    public func renderIcon(
        _ iconName: String,
        weight: Ph.IconWeight = .regular,
        size: CGSize = CGSize(width: 24, height: 24),
        color: Color = .primary
    ) -> Image {
        
        let cacheKey = cacheKeyFor(iconName: iconName, weight: weight, size: size, color: color)
        
        // Check for cached rendered image
        if let cachedImage = imageCache.object(forKey: cacheKey) {
            return makeTemplateImage(from: cachedImage, named: iconName)
        }

        // Load and parse SVG data
        guard let svgData = loadSVGData(for: iconName, weight: weight) ?? loadSVGData(for: iconName, weight: .regular) else {
            // Create a simple fallback image using a question mark path
            let fallbackSVG = SVGData(
                viewBox: CGRect(x: 0, y: 0, width: 256, height: 256),
                paths: [SVGPath(pathData: "M128,24A104,104,0,1,0,232,128,104.11,104.11,0,0,0,128,24Z", fill: "currentColor")]
            )
            guard let fallbackImage = renderSVGToImage(fallbackSVG, size: size) else {
                return Image("questionmark", bundle: .main) // Final fallback
            }
            return makeTemplateImage(from: fallbackImage, named: "fallback")
        }

        guard let renderedImage = renderSVGToImage(svgData, size: size) else {
            return Image("questionmark", bundle: .main) // Fallback
        }

        // Cache the rendered result
        imageCache.setObject(renderedImage, forKey: cacheKey)

        return makeTemplateImage(from: renderedImage, named: iconName)
    }

    /// Loads and parses SVG data from bundle, with caching
    private func loadSVGData(for iconName: String, weight: Ph.IconWeight) -> SVGData? {
        let cacheKey = "\(weight.rawValue)-\(iconName)" as NSString

        // Check cache first
        if let cachedData = svgCache.object(forKey: cacheKey) {
            return cachedData
        }

        // Load from bundle (from BaseSVGs directory)
        let subdirectory = "BaseSVGs/\(weight.rawValue)"
        guard let svgURL = Bundle.module.url(forResource: iconName, withExtension: "svg", subdirectory: subdirectory),
              let svgString = try? String(contentsOf: svgURL) else {
            return nil
        }
        
        // Parse SVG
        guard let svgData = SVGParser.parse(svgString) else {
            return nil
        }
        
        // Cache parsed data
        svgCache.setObject(svgData, forKey: cacheKey)
        return svgData
    }

    /// Renders transformed SVG to CGImage
    private func renderSVGToImage(_ svgData: SVGData, size: CGSize) -> CGImage? {
        return SVGRasterizer.rasterize(svgData, to: size)
    }

    private func makeTemplateImage(from cgImage: CGImage, named iconName: String) -> Image {
        Image(cgImage, scale: 1.0, label: Text(iconName)).renderingMode(.template)
    }

    private func cacheKeyFor(iconName: String, weight: Ph.IconWeight, size: CGSize, color: Color) -> NSString {
        let colorDescription = String(describing: color)
        return "\(iconName)-\(weight.rawValue)-\(size.width)x\(size.height)-\(colorDescription)" as NSString
    }
    
    /// Clears all caches to free memory
    public func clearCaches() {
        svgCache.removeAllObjects()
        imageCache.removeAllObjects()
    }
}

/// Represents parsed SVG data with path information
public class SVGData {
    let viewBox: CGRect
    let paths: [SVGPath]
    
    public init(viewBox: CGRect, paths: [SVGPath]) {
        self.viewBox = viewBox
        self.paths = paths
    }
}

/// Represents an SVG path with styling information
public struct SVGPath {
    let pathData: String
    let fillRule: String?
    let strokeWidth: Double?
    let fill: String?
    let stroke: String?
    let opacity: Double?
    let fillOpacity: Double?
    let strokeOpacity: Double?
    
    public init(pathData: String,
                fillRule: String? = nil,
                strokeWidth: Double? = nil,
                fill: String? = nil,
                stroke: String? = nil,
                opacity: Double? = nil,
                fillOpacity: Double? = nil,
                strokeOpacity: Double? = nil) {
        self.pathData = pathData
        self.fillRule = fillRule
        self.strokeWidth = strokeWidth
        self.fill = fill
        self.stroke = stroke
        self.opacity = opacity
        self.fillOpacity = fillOpacity
        self.strokeOpacity = strokeOpacity
    }
}
