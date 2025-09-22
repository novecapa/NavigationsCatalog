//
//  TabDestinations.swift
//  NavigationsCatatog
//
//  Created by Josep Cerdá Penadés on 22/9/25.
//

import SwiftUI

enum TabDestinations {
    case tab(view: AnyView)
}

extension TabDestinations: Identifiable, Hashable {
    var id: UUID { UUID() }

    static func == (lhs: TabDestinations,
                    rhs: TabDestinations) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
