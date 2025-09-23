//
//  MainView.swift
//  NavigationsCatatog
//
//  Created by Josep Cerdá Penadés on 23/9/25.
//

import SwiftUI

struct MainView: View {

    @State private var router: Router

    init(router: Router = Router(level: 0,
                                 identifierTab: nil)) {
        self.router = router
    }

    var body: some View {
        TabView(selection: $router.selectedTab) {
            Tab("Home",
                systemImage: "house",
                value: TabDestinations.home) {
                NavigationContainer(parentRouter: router,
                                    tab: .home) {
                    ContentView()
                }
            }
        }
    }
}

#Preview {
    MainView()
}
