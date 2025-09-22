//
//  Destination.swift
//  NavigationsCatatog
//
//  Created by Josep on 22/9/25.
//

import Foundation

enum Destination: Hashable {
    case push(PushDestinations)
    case sheet(SheetDestinations)
    case fullScreen(FullScreenDestinations)
}
