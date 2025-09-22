//
//  PushDestinations.swift
//  NavigationsCatatog
//
//  Created by Josep Cerdá Penadés on 22/9/25.
//

import SwiftUI

enum PushDestinations {
    case push(view: AnyView)
}

extension PushDestinations: Identifiable, Hashable {
    var id: UUID { UUID() }

    static func == (lhs: PushDestinations,
                    rhs: PushDestinations) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
