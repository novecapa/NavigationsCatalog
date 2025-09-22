//
//  ViewBuilders.swift
//  NavigationsCatatog
//
//  Created by Josep Cerdá Penadés on 22/9/25.
//

import SwiftUI

final class ViewBuilders {
    @ViewBuilder
    func view(for destination: PushDestinations) -> some View {
        switch destination {
        case .push(let view):
            view
        }
    }

    @ViewBuilder
    func view(for destination: SheetDestinations) -> some View {
        Group {
            switch destination {
            case .sheet(let view, let detents):
                view
                    .presentationDetents(detents)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .addDismissButton()
        .presentationBackground(.regularMaterial)
    }

    @ViewBuilder
    func view(for destination: FullScreenDestinations) -> some View {
        Group {
            switch destination {
            case .fullScreen(let view):
                view
            }
        }
        .addDismissButton()
        .presentationBackground(.regularMaterial)
    }
}

extension View {
    var toAnyView: AnyView {
        AnyView(self)
    }
}
