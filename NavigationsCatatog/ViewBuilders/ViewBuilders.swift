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
            case .sheet1:
                Text("sheet1")
            case .sheet2:
                Text("sheet2")
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .addDismissButton()
        .presentationDetents([.medium, .large])
        .presentationBackground(.regularMaterial)
    }

    @ViewBuilder
    func view(for destination: FullScreenDestinations) -> some View {
        Group {
            switch destination {
            case .fullScreen1:
                Text("fullScreen1")
            case .fullScreen2:
                Text("fullScreen2")
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
