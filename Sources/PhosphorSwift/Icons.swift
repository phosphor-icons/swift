//
//  Icons.swift
//  Phosphor Icons
//
//  Created by Tobias Fried on 1/22/23.
//

import SwiftUI

public enum Ph: String, CaseIterable {
    case addressBook = "address-book"
    case airTrafficControl = "air-traffic-control"
    
    var regular: Image {
        get { return Image(self.rawValue) }
    }
    var thin: Image {
        get { return Image("\(self.rawValue)-thin") }
    }
    var light: Image {
        get { return Image("\(self.rawValue)-light") }
    }
    var bold: Image {
        get { return Image("\(self.rawValue)-bold") }
    }
    var fill: Image {
        get { return Image("\(self.rawValue)-fill") }
    }
    var duotone: Image {
        get { return Image("\(self.rawValue)-duotone") }
    }
}


