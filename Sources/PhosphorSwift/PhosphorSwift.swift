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

    var regular: Image { 
        SVGRenderer.shared.renderIcon(self.rawValue, weight: .regular)
    }
    var thin: Image { 
        SVGRenderer.shared.renderIcon(self.rawValue, weight: .thin)
    }
    var light: Image { 
        SVGRenderer.shared.renderIcon(self.rawValue, weight: .light)
    }
    var bold: Image { 
        SVGRenderer.shared.renderIcon(self.rawValue, weight: .bold)
    }
    var fill: Image { 
        SVGRenderer.shared.renderIcon(self.rawValue, weight: .fill)
    }
    var duotone: Image { 
        SVGRenderer.shared.renderIcon(self.rawValue, weight: .duotone)
    }

    func weight(_ weight: IconWeight) -> Image {
        SVGRenderer.shared.renderIcon(self.rawValue, weight: weight)
    }
    
    func weight(_ weight: IconWeight, size: CGSize) -> Image {
        SVGRenderer.shared.renderIcon(self.rawValue, weight: weight, size: size)
    }
    
    func small(_ weight: IconWeight = .regular) -> Image {
        SVGRenderer.shared.renderIcon(self.rawValue, weight: weight, size: CGSize(width: 16, height: 16))
    }
    
    func medium(_ weight: IconWeight = .regular) -> Image {
        SVGRenderer.shared.renderIcon(self.rawValue, weight: weight, size: CGSize(width: 24, height: 24))
    }
    
    func large(_ weight: IconWeight = .regular) -> Image {
        SVGRenderer.shared.renderIcon(self.rawValue, weight: weight, size: CGSize(width: 32, height: 32))
    }
}

public extension Image {
    func color(_ color: Color) -> some View {
        self.renderingMode(.template)
            .foregroundColor(color)
    }
}

public extension View {
    func color(_ color: Color) -> some View {
        foregroundColor(color)
    }
}
