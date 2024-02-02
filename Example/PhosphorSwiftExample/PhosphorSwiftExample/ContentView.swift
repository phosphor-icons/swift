//
//  ContentView.swift
//  PhosphorSwiftExample
//
//  Created by Helena Zhang on 1/24/24.
//

import PhosphorSwift
import SwiftUI

extension String {
    func camelCased(with separator: Character) -> String {
        return self.lowercased()
            .split(separator: separator)
            .enumerated()
            .map { $0.offset > 0 ? $0.element.capitalized : $0.element.lowercased() }
            .joined()
    }
}

struct ContentView: View {
    @State private var selectedWeight: Ph.IconWeight = .regular
    @State private var color = Color.primary
    @State private var size = 24
    @State private var cols = 12
    @State private var interp = Image.Interpolation.medium
    @State private var aa = true

    private var columns: [GridItem] {
        return Array(repeating: GridItem(.fixed(CGFloat(size)), spacing: 8), count: cols)
    }

    var body: some View {
        HSplitView {
            Form {
                Section(header: Text("Icon Style").font(.headline.smallCaps())) {
                    Picker("Weight", selection: $selectedWeight) {
                        Text("Regular").tag(Ph.IconWeight.regular)
                        Text("Thin").tag(Ph.IconWeight.thin)
                        Text("Light").tag(Ph.IconWeight.light)
                        Text("Bold").tag(Ph.IconWeight.bold)
                        Text("Fill").tag(Ph.IconWeight.fill)
                        Text("Duotone").tag(Ph.IconWeight.duotone)
                    }
                    ColorPicker("Color", selection: $color)
                    LabeledContent("Size") {
                        HStack {
                            TextField("", value: $size, formatter: NumberFormatter())
                                .multilineTextAlignment(.trailing)
                                .textFieldStyle(.plain)
                                .labelsHidden()
                                .frame(maxWidth: 60)
                            Stepper("Value", value: $size, in: 16 ... 256, step: 4)
                                .labelsHidden()
                        }
                    }
                    LabeledContent("Columns") {
                        HStack {
                            TextField("", value: $cols, formatter: NumberFormatter())
                                .multilineTextAlignment(.trailing)
                                .textFieldStyle(.plain)
                                .labelsHidden()
                                .frame(maxWidth: 60)
                            Stepper("", value: $cols, in: 1 ... 100)
                                .labelsHidden()
                        }
                    }
                }

                Section(header: Text("Rendering").font(.headline.smallCaps())) {
                    Picker("Interpolation", selection: $interp) {
                        Text("None").tag(Image.Interpolation.none)
                        Text("Low").tag(Image.Interpolation.low)
                        Text("Medium").tag(Image.Interpolation.medium)
                        Text("High").tag(Image.Interpolation.high)
                    }.pickerStyle(.inline)
                    Toggle("Antialiasing", isOn: $aa)
                }
            }
            .formStyle(.grouped)
            .frame(minWidth: 280, idealWidth: 300, maxHeight: .infinity)

            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(Ph.allCases) { icon in
                        icon.weight(selectedWeight)
                            .interpolation(interp)
                            .antialiased(aa)
                            .aspectRatio(contentMode: .fit)
                            .color(color)
                            .help(icon.rawValue.camelCased(with: "-"))
                    }
                }.padding()
            }.frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ContentView()
}
