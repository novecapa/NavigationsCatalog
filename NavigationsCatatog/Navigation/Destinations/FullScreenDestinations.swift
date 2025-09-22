//
//  FullScreenDestinations.swift
//  NavigationsCatatog
//
//  Created by Josep Cerdá Penadés on 22/9/25.
//

import SwiftUI

enum FullScreenDestinations {
    case fullScreen(view: AnyView)
}

extension FullScreenDestinations: Identifiable {
    var id: UUID { UUID() }

    static func == (lhs: FullScreenDestinations,
                    rhs: FullScreenDestinations) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
