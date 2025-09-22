//
//  SheetDestinations.swift
//  NavigationsCatatog
//
//  Created by Josep Cerdá Penadés on 22/9/25.
//

import SwiftUI

enum SheetDestinations  {
    case sheet(view: AnyView, detents: Set<PresentationDetent> = [.medium, .large])
}

extension SheetDestinations: Identifiable, Hashable {
    var id: UUID { UUID() }

    static func == (lhs: SheetDestinations,
                    rhs: SheetDestinations) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
