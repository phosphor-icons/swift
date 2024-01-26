//
//  ContentView.swift
//  PhosphorSwiftExample
//
//  Created by Helena Zhang on 1/24/24.
//

import GridStack
import PhosphorSwift
import SwiftUI

let columns = [
    GridItem(.fixed(32), spacing: 8),
    GridItem(.fixed(32), spacing: 8),
    GridItem(.fixed(32), spacing: 8),
    GridItem(.fixed(32), spacing: 8),
    GridItem(.fixed(32), spacing: 8),
    GridItem(.fixed(32), spacing: 8),
]

struct ContentView: View {
    @State private var selectedWeight: Ph.IconWeight = .regular

    var body: some View {
        Picker("Weight", selection: $selectedWeight) {
            Text("Regular").tag(Ph.IconWeight.regular)
            Text("Thin").tag(Ph.IconWeight.thin)
            Text("Light").tag(Ph.IconWeight.light)
            Text("Bold").tag(Ph.IconWeight.bold)
            Text("Fill").tag(Ph.IconWeight.fill)
            Text("Duotone").tag(Ph.IconWeight.duotone)
        }.padding()

        GridStack(minCellWidth: 48, spacing: 8, numItems: Ph.allCases.count) { index, width in
            Ph.allCases[index].weight(selectedWeight)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: width)
                .color(.clear)
        }.padding()
//        ScrollView {
//            LazyVGrid(columns: columns) {
//                ForEach(Ph.allCases) { icon in
//                    icon.regular
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .color(.orange)
//                    icon.thin
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .color(.pink)
//                    icon.light
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .color(.blue)
//                    icon.bold
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .color(.mint)
//                    icon.fill
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .color(.yellow)
//                    icon.duotone
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .color(.purple)
//                }
//            }.padding()
//        }
    }
}

#Preview {
    ContentView()
}
