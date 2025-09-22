//
//  ContentView.swift
//  NavigationsCatatog
//
//  Created by Josep Cerdá Penadés on 22/9/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            NavigationAction(fullScreen: .fullScreen(view: Text("My full screen").toAnyView)) {
                Text("full Screen 1")
            }
            NavigationAction(sheet: .sheet(view: Text("My sheet view").toAnyView)) {
                Text("sheet 1")
            }
            NavigationAction(push: .push(view: MyPushView(name: "Hola Push").toAnyView)) {
                Text("push 1")
            }
        }
        .padding()
    }
}

struct MyPushView: View {

    let name: String
    
    var body: some View {
        VStack {
            Text(name)
            NavigationAction(push: .push(view: Text("My push 2").toAnyView)) {
                Text("push 2")
            }
        }
    }
}

#Preview {
    ContentView()
}
