//
//  DismissButtonModifier.swift
//  NavigationsCatatog
//
//  Created by Josep Cerdá Penadés on 22/9/25.
//

import SwiftUI

public struct DismissButtonModifier: ViewModifier {

    @Environment(\.dismiss) var dismiss

    public func body(content: Content) -> some View {
        content.toolbar {
            Button {
                dismiss()
            } label: {
                Text("Close")
            }
        }
    }
}

public extension View {
    func addDismissButton() -> some View {
        modifier(DismissButtonModifier())
    }
}
