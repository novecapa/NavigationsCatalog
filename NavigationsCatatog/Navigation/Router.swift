//
//  Router.swift
//  NavigationsCatatog
//
//  Created by Josep Cerdá Penadés on 22/9/25.
//

import Foundation

@Observable
final class Router {

    var pushDestinations: [PushDestinations] = []
    var sheetDestination: SheetDestinations?
    var fullScreenDestination: FullScreenDestinations?

    private func resetContent() {
        pushDestinations = []
        sheetDestination = nil
        fullScreenDestination = nil
    }
}

// MARK: Navigation

extension Router {
    func navigate(to destination: Destination) {
        switch destination {
        case .push(let pushDestination):
            push(pushDestination)
        case .sheet(let sheetDestination):
            presentSheet(sheetDestination)
        case .fullScreen(let fullScreenDestination):
            presentFullScreen(fullScreenDestination)
        }
    }
}

// MARK: Navigation methods

extension Router {
    func push(_ destination: PushDestinations) {
        pushDestinations.append(destination)
    }

    func presentSheet(_ destination: SheetDestinations) {
        sheetDestination = destination
    }

    func presentFullScreen(_ destination: FullScreenDestinations) {
        fullScreenDestination = destination
    }
}
