//
//  PhosphorSwift.swift
//  Phosphor Icons
//
//  Created by Tobias Fried on 1/22/23.
//

import SwiftUI

public extension Ph {
    public enum IconWeight: String, CaseIterable, Identifiable {
        public var id: Self { self }
        
        case regular
        case thin
        case light
        case bold
        case fill
        case duotone
    }

    public var regular: Image { return Image(self.rawValue, bundle: .module) }
    public var thin: Image { return Image("\(self.rawValue)-thin", bundle: .module) }
    public var light: Image { return Image("\(self.rawValue)-light", bundle: .module) }
    public var bold: Image { return Image("\(self.rawValue)-bold", bundle: .module) }
    public var fill: Image { return Image("\(self.rawValue)-fill", bundle: .module) }
    public var duotone: Image { return Image("\(self.rawValue)-duotone", bundle: .module) }
    
    public func weight(_ weight: IconWeight) -> Image {
        switch weight {
        case .regular: return self.regular
        case .thin: return self.thin
        case .light: return self.light
        case .bold: return self.bold
        case .fill: return self.fill
        case .duotone: return self.duotone
        }
    }
}

public struct ColorBlended: ViewModifier {
    fileprivate var color: Color

    public func body(content: Content) -> some View {
        VStack {
            ZStack {
                content
                color.blendMode(.sourceAtop)
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
