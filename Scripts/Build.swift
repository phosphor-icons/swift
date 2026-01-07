//
//  Build.swift
//  PhosphorSwift
//
//  Created by Tobias Fried on 1/25/24.
//

import Foundation

@main
enum Build {
    static func main() async throws {
        shell("git", "submodule", "update", "--remote", "--init", "--force", "--recursive")
        
        // Extract base icons from regular directory
        let icons = try await extractBaseIcons()
        print("Extracted \(icons.count) base icons")
        
        // Copy base SVG files
        try await copyBaseSVGs(icons)
        print("Copied base SVG files")
        
        // Generate Icons.swift
        try await emitSource(icons: icons)
        print("Generated source code")
        
        // Clean up old weight variants
        try await cleanupOldAssets()
        print("Cleaned up old assets")
        
        print("Build complete!")
    }
}

struct Contents: Codable {
    let images: [ContentImage]
    let info: ContentInfo
    let properties: ContentProperties
    
    static func forFile(filename: String) -> Self {
        return Contents(
            images: [ContentImage(filename: filename, idiom: "universal")],
            info: ContentInfo(author: "xcode", version: 1),
            properties: ContentProperties(templateRenderingIntent: "template"))
    }
}

struct ContentImage: Codable {
    let filename: String
    let idiom: String
}

struct ContentInfo: Codable {
    let author: String
    let version: Int
}

struct ContentProperties: Codable {
    let templateRenderingIntent: String
    enum CodingKeys: String, CodingKey {
        case templateRenderingIntent = "template-rendering-intent"
    }
}

extension String {
    func camelCased(with separator: Character) -> String {
        return self.lowercased()
            .split(separator: separator)
            .enumerated()
            .map { $0.offset > 0 ? $0.element.capitalized : $0.element.lowercased() }
            .joined()
    }
}

func extractBaseIcons() async throws -> Set<String> {
    let CORE_REGULAR_DIR = URL(fileURLWithPath: "./core/assets/regular", isDirectory: true)
    let fm = FileManager.default
    var baseIcons: Set<String> = Set()
    
    guard fm.fileExists(atPath: CORE_REGULAR_DIR.path) else {
        print("Core regular assets directory not found.")
        throw BuildError.missingCoreAssets
    }
    
    let resourceKeys: [URLResourceKey] = [.isDirectoryKey]
    guard let enumerator = fm.enumerator(
        at: CORE_REGULAR_DIR,
        includingPropertiesForKeys: resourceKeys,
        options: [.skipsHiddenFiles]
    ) else {
        throw BuildError.cannotEnumerateAssets
    }
    
    for case let fileURL as URL in enumerator {
        let resourceValues = try fileURL.resourceValues(forKeys: Set(resourceKeys))
        guard !resourceValues.isDirectory! else { continue }
        
        let fileName = fileURL.deletingPathExtension().lastPathComponent
        baseIcons.insert(fileName)
    }
    
    return baseIcons
}

enum IconWeight: String, CaseIterable {
    case regular
    case thin
    case light
    case bold
    case fill
    case duotone

    var directoryName: String { rawValue }

    var filenameSuffix: String? {
        switch self {
        case .regular:
            return nil
        case .thin, .light, .bold, .fill, .duotone:
            return "-\(rawValue)"
        }
    }
}

func copyBaseSVGs(_ baseIcons: Set<String>) async throws {
    let svgRoot = URL(fileURLWithPath: "./Sources/PhosphorSwift/Resources/BaseSVGs", isDirectory: true)
    let fm = FileManager.default

    if fm.fileExists(atPath: svgRoot.path) {
        try fm.removeItem(at: svgRoot)
    }
    try fm.createDirectory(at: svgRoot, withIntermediateDirectories: true)

    var missing: [IconWeight: [String]] = [:]

    for weight in IconWeight.allCases {
        let destinationDirectory = svgRoot.appendingPathComponent(weight.rawValue, isDirectory: true)
        try fm.createDirectory(at: destinationDirectory, withIntermediateDirectories: true)

        let sourceDirectory = URL(fileURLWithPath: "./core/assets/\(weight.directoryName)", isDirectory: true)
        guard fm.fileExists(atPath: sourceDirectory.path) else {
            print("Missing source directory for weight \(weight.rawValue) at \(sourceDirectory.path)")
            continue
        }

        for icon in baseIcons {
            let filename: String
            if let suffix = weight.filenameSuffix {
                filename = "\(icon)\(suffix).svg"
            } else {
                filename = "\(icon).svg"
            }
            let sourceURL = sourceDirectory.appendingPathComponent(filename)
            let destinationURL = destinationDirectory.appendingPathComponent("\(icon).svg")

            if fm.fileExists(atPath: sourceURL.path) {
                try fm.copyItem(at: sourceURL, to: destinationURL)
            } else {
                missing[weight, default: []].append(icon)
            }
        }
    }

    if !missing.isEmpty {
        for (weight, icons) in missing {
            print("Missing \(icons.count) icons for weight \(weight.rawValue): \(icons.sorted().joined(separator: ", "))")
        }
    }
}

func cleanupOldAssets() async throws {
    let ASSETS_DIR = URL(fileURLWithPath: "./Sources/PhosphorSwift/Resources/Assets.xcassets", isDirectory: true)
    let fm = FileManager.default
    
    // Remove the old SVG assets directory
    let svgAssetsDir = ASSETS_DIR.appendingPathComponent("SVG")
    if fm.fileExists(atPath: svgAssetsDir.path) {
        try fm.removeItem(at: svgAssetsDir)
    }
}

enum BuildError: Error {
    case cannotEnumerateAssets
    case missingCoreAssets
}

func emitSource(icons: Set<String>) async throws {
    let ICONS_SOURCE = URL(fileURLWithPath: "./Sources/PhosphorSwift/Icons.swift", isDirectory: false)
    
    let enumEntries = icons.sorted().map { name in
        let caseName = name.camelCased(with: "-")
        // Handle Swift keywords
        if caseName == "repeat" {
            return "    case `\(caseName)` = \"\(name)\""
        }
        return "    case \(caseName) = \"\(name)\""
    }
    let source = """
    //
    //  Icons.swift
    //  Phosphor Icons
    //
    //  Created by Tobias Fried on 1/22/23.
    //  GENERATED FILE
    //
    
    import SwiftUI
    
    public enum Ph: String, CaseIterable, Identifiable {
        public var id: Self { self }
    
    \(enumEntries.joined(separator: "\n"))
    }
    
    """
        
    try source.write(to: ICONS_SOURCE, atomically: true, encoding: .utf8)
}

@discardableResult
func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}
