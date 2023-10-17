//
//  ContentView.swift
//  Social Symbols Showcase
//
//  Created by Jeremie Berduck on 04/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.symbols) { symbol in
                    NavigationLink(destination: SymbolDetail(symbol: symbol)) {
                        Label(symbol.name, image: symbol.file)
                    }
                }
                Section {
                    VStack(alignment: .center, spacing: 16) {
                        Image("signature")
                        Image("amsterdam")
                    }.frame(maxWidth: .infinity).foregroundColor(.accentColor)
                }.listRowInsets(.init()).listRowBackground(Color.clear).listRowSeparator(.hidden)
            }
            #if os(iOS)
            .navigationBarTitleDisplayMode(.large)
            #endif
            .navigationTitle("Social Symbols")
        }
    }
    
    @ViewBuilder private func SymbolDetail(symbol: Symbol) -> some View {
        
        let fontStyles: [FontStyle] = [
            .init(name: "Caption", style: .caption),
            .init(name: "Footnote", style: .footnote),
            .init(name: "SubHeadline", style: .subheadline),
            .init(name: "Body", style: .body),
            .init(name: "Headline", style: .headline),
            .init(name: "Title 3", style: .title3),
            .init(name: "Title 2", style: .title2),
            .init(name: "Title", style: .title),
            .init(name: "Large Title", style: .largeTitle)
        ]
        
        List {
            Section("Monocrome") {
                ScrollView(.horizontal) {
                    HStack(alignment: .firstTextBaseline, spacing: 8) {
                        ForEach(fontStyles) { style in
                            Image(symbol.file)
                                .font(style.style)
                        }
                    }.symbolRenderingMode(.monochrome)
                }
            }
            
            Section("Hierarchical") {
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    ForEach(fontStyles) { style in
                        Image(symbol.file)
                            .font(style.style)
                    }
                }.symbolRenderingMode(.hierarchical)
            }
            
            Section("Palette") {
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    ForEach(fontStyles) { style in
                        Image(symbol.file)
                            .font(style.style)
                    }
                }.symbolRenderingMode(.palette).foregroundStyle(.pink, .orange, .blue)
            }
            
            Section(header: Text("Multicolor"), footer: Text("Using official brand colors")) {
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    ForEach(fontStyles) { style in
                        Image(symbol.file)
                            .font(style.style)
                    }
                }.symbolRenderingMode(.multicolor).listRowBackground(Color.primary)
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    ForEach(fontStyles) { style in
                        Image(symbol.file)
                            .font(style.style)
                    }
                }.symbolRenderingMode(.multicolor)
            }
        }.navigationTitle(symbol.name)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
