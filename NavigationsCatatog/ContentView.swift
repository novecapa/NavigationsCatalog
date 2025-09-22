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
            NavigationAction(fullScreen: .fullScreen1) {
                Text("full Screen 1")
            }
            NavigationAction(sheet: .sheet1) {
                Text("sheet 1")
            }
            NavigationAction(push: .push(view: Text("My push 1").toAnyView)) {
                Text("push 1")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
