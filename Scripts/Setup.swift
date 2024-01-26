//
//  Setup.swift
//  PhosphorSwift
//
//  Created by Tobias Fried on 1/25/24.
//

import Foundation

@main
enum Setup {
    static func main() async throws {
        let icons = try await buildAssets()
        try await emitSource(icons: icons)
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

func buildAssets() async throws -> Set<String> {
    let CORE_DIR = URL(fileURLWithPath: "./core/assets", isDirectory: true)
    let ASSETS_DIR = URL(fileURLWithPath: "./Sources/PhosphorSwift/Assets.xcassets/SVG", isDirectory: true)
    
    let fm = FileManager.default
    let encoder = JSONEncoder()
    
    var icons: Set<String> = Set()
    
    do {
        let resourceKeys: [URLResourceKey] = [.creationDateKey, .isDirectoryKey]
        let enumerator = fm.enumerator(
            at: CORE_DIR,
            includingPropertiesForKeys: resourceKeys,
            options: [.skipsHiddenFiles])!
        
        for case let fileURL as URL in enumerator {
            let resourceValues = try fileURL.resourceValues(forKeys: Set(resourceKeys))
            if !resourceValues.isDirectory! {
                let fileName = fileURL.deletingPathExtension().lastPathComponent
                let directory = ASSETS_DIR.appendingPathComponent("\(fileName).imageset")
                let svgURL = directory.appendingPathComponent("\(fileName).svg")
                
                let contents = try encoder.encode(Contents.forFile(filename: "\(fileName).svg"))
                
                try fm.createDirectory(at: directory, withIntermediateDirectories: true, attributes: nil)
                try fm.removeItem(at: svgURL)
                try fm.copyItem(at: fileURL, to: svgURL)
                try contents.write(to: directory.appendingPathComponent("Contents.json"), options: .atomic)
            
                if !(fileName.hasSuffix("-thin") || fileName.hasSuffix("-light") || fileName.hasSuffix("-bold") || fileName.hasSuffix("-fill") || fileName.hasSuffix("-duotone")) {
                    icons.insert(fileName)
                }
                
                print(fileName, contents)
            }
        }
    } catch {
        print(error)
    }
    
    return icons
}

func emitSource(icons: Set<String>) async throws {
    let ICONS_SOURCE = URL(fileURLWithPath: "./Sources/PhosphorSwift/Icons.swift", isDirectory: false)
    
    let enumEntries = icons.sorted().map { name in
        "    case \(name.camelCased(with: "-")) = \"\(name)\""
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
