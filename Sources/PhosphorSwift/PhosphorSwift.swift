//
//  PhosphorSwift.swift
//  Phosphor Icons
//
//  Created by Tobias Fried on 1/22/23.
//

import SwiftUI

public extension Ph {
    enum IconWeight: String, CaseIterable, Identifiable {
        public var id: Self { self }

        case regular
        case thin
        case light
        case bold
        case fill
        case duotone
    }

    var regular: Image { Ph.icon(self.rawValue) }
    var thin: Image { Ph.icon("\(self.rawValue)-thin") }
    var light: Image { Ph.icon("\(self.rawValue)-light") }
    var bold: Image { Ph.icon("\(self.rawValue)-bold") }
    var fill: Image { Ph.icon("\(self.rawValue)-fill") }
    var duotone: Image { Ph.icon("\(self.rawValue)-duotone") }

    func weight(_ weight: IconWeight) -> Image {
        switch weight {
        case .regular: return self.regular
        case .thin: return self.thin
        case .light: return self.light
        case .bold: return self.bold
        case .fill: return self.fill
        case .duotone: return self.duotone
        }
    }
    
    private static func icon(_ name: String) -> Image {
        Image(name, bundle: .module)
            .interpolation(.medium)
            .resizable()
    }
}

struct ColorBlended: ViewModifier {
    fileprivate var color: Color

    public func body(content: Content) -> some View {
        VStack {
            ZStack {
                content
                self.color.blendMode(.sourceAtop)
            }
            .drawingGroup(opaque: false)
        }
    }
}

public extension View {
    func color(_ color: Color) -> some View {
        modifier(ColorBlended(color: color))
    }
}
