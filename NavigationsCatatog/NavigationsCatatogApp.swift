//
//  NavigationsCatatogApp.swift
//  NavigationsCatatog
//
//  Created by Josep Cerdá Penadés on 22/9/25.
//

import SwiftUI

@main
struct NavigationsCatatogApp: App {
    
    @State private var router = Router(level: 0, identifierTab: nil)

    var body: some Scene {
        WindowGroup {
            NavigationContainer(parentRouter: router) {
                ContentView()
            }
        }
    }
}
