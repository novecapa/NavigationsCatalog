//
//  NavigationAction.swift
//  NavigationsCatatog
//
//  Created by Josep Cerdá Penadés on 22/9/25.
//

import SwiftUI

struct NavigationAction<Content: View>: View {

    let destination: Destination
    @ViewBuilder var content: () -> Content
    @Environment(Router.self) private var router

    init(
        destination: Destination,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.destination = destination
        self.content = content
    }

    init(push destination: PushDestinations,
         @ViewBuilder content: @escaping() -> Content) {
        self.destination = .push(destination)
        self.content = content
    }

    init(sheet destination: SheetDestinations,
         @ViewBuilder content: @escaping() -> Content) {
        self.destination = .sheet(destination)
        self.content = content
    }

    init(fullScreen destination: FullScreenDestinations,
         @ViewBuilder content: @escaping() -> Content) {
        self.destination = .fullScreen(destination)
        self.content = content
    }

    public var body: some View {
        Button {
            router.navigate(to: destination)
        } label: {
            content()
        }
    }
}
