//
//  BackButtonModifier.swift
//  NavigationsCatatog
//
//  Created by Josep Cerdá Penadés on 23/9/25.
//

import SwiftUI

public struct BackButtonModifier: ViewModifier {

    private enum Constants {
        static let frameSize: CGFloat = 32
    }
    
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
                            Image(systemName: systemImage)
                                .resizable()
                                .scaledToFit()
                                .tint(.black)
                                .frame(width: Constants.frameSize,
                                       height: Constants.frameSize)
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
                       systemImage: String? = "arrowshape.backward.circle") -> some View {
        modifier(
            BackButtonModifier(
                title: title,
                systemImage: systemImage
            )
        )
    }
}

#if DEBUG

struct BackButtonView: View {
    var body: some View {
        Text("Back Button View")
            .addBackButton(systemImage: "arrowshape.backward.circle")
    }
}

#endif

#Preview {
    NavigationContainer(
        parentRouter: Router(level: 0,
                             identifierTab: nil)
    ) {
        BackButtonView()
    }
}
