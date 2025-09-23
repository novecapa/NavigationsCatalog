//
//  BackButtonModifier.swift
//  NavigationsCatatog
//
//  Created by Josep Cerdá Penadés on 23/9/25.
//

import SwiftUI

public struct BackButtonModifier: ViewModifier {
    @Environment(\.dismiss) var dismiss
    
    var title: String
    var systemImage: String?
    
    public func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        if let systemImage {
                            Label(title, systemImage: systemImage)
                        } else {
                            Text(title)
                        }
                    }
                }
            }
    }
}

public extension View {
    func addBackButton(title: String = "Back",
                       systemImage: String? = nil) -> some View {
        modifier(BackButtonModifier(title: title, systemImage: systemImage))
    }
}
