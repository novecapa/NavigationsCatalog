//
//  Router.swift
//  NavigationsCatatog
//
//  Created by Josep Cerdá Penadés on 22/9/25.
//

import Foundation
import SwiftUI

@Observable
final class Router {

    let id = UUID()
    let level: Int

    let identifierTab: TabDestinations?

    var selectedTab: TabDestinations?

    var pushDestinations: [PushDestinations] = []
    var sheetDestination: SheetDestinations?
    var fullScreenDestination: FullScreenDestinations?

    weak var parent: Router?

    private(set) var isActive: Bool = false

    public init(level: Int, identifierTab: TabDestinations?) {
        self.level = level
        self.identifierTab = identifierTab
        self.parent = nil
    }

    private func resetContent() {
        pushDestinations = []
        sheetDestination = nil
        fullScreenDestination = nil
    }
}

// MARK: - Router Management

extension Router {
    func childRouter(for tab: TabDestinations? = nil) -> Router {
        let router = Router(level: level + 1, identifierTab: tab ?? identifierTab)
        router.parent = self
        return router
    }

    func setActive() {
        parent?.resignActive()
        isActive = true
    }

    func resignActive() {
        isActive = false
        parent?.setActive()
    }

    static func previewRouter() -> Router {
        Router(level: 0, identifierTab: nil)
    }
}

// MARK: Navigation

extension Router {
    func navigate(to destination: Destination) {
        switch destination {
        case let .tab(tab):
            select(tab: tab)
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
    func select(tab destination: TabDestinations) {
        if level == 0 {
            selectedTab = destination
        } else {
            parent?.select(tab: destination)
            resetContent()
        }
    }

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
