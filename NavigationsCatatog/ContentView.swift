//
//  ContentView.swift
//  NavigationsCatatog
//
//  Created by Josep Cerdá Penadés on 22/9/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            NavigationAction(push: .push1) {
                DetailView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
