//
//  NavigationContainer.swift
//  NavigationsCatatog
//
//  Created by Josep Cerdá Penadés on 22/9/25.
//

import SwiftUI

struct NavigationContainer<Content: View>: View {

    @State var router: Router
    @ViewBuilder var content: () -> Content

    init(
        parentRouter: Router,
        tab: TabDestinations? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._router = .init(initialValue: parentRouter.childRouter(for: tab))
        self.content = content
    }

    var body: some View {
        InnerContainer(router: router) {
            content()
        }
        .environment(router)
        .onAppear(perform: router.setActive)
        .onDisappear(perform: router.resignActive)
        .onOpenURL(perform: openDeepLinkIfFound(for:))
    }

    func openDeepLinkIfFound(for url: URL) {
        if let destination = DeepLink.destination(from: url) {
            router.deepLinkOpen(to: destination)
        }
    }
}

private struct InnerContainer<Content: View>: View {

    @Bindable var router: Router
    @ViewBuilder var content: () -> Content

    var body: some View {
        NavigationStack(path: $router.pushDestinations) {
            content()
                .navigationDestination(for: PushDestinations.self) { destination in
                    ViewBuilders().view(for: destination)
                }
        }
        .sheet(item: $router.sheetDestination) { sheet in
            navigationView(for: sheet, from: router)
        }
        .fullScreenCover(item: $router.fullScreenDestination) { fullScreen in
            navigationView(for: fullScreen, from: router)
        }
    }

    @ViewBuilder
    func navigationView(for destination: SheetDestinations,
                        from router: Router) -> some View {
        NavigationContainer(parentRouter: router) {
            ViewBuilders().view(for: destination)
        }
    }

    @ViewBuilder
    func navigationView(for destination: FullScreenDestinations, from router: Router) -> some View {
        NavigationContainer(parentRouter: router) {
            ViewBuilders().view(for: destination)
        }
    }
}
