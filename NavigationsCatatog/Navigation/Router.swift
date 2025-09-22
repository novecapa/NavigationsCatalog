//
//  Router.swift
//  NavigationsCatatog
//
//  Created by Josep on 22/9/25.
//

import Foundation

final class Router: ObservableObject {

    @Published var pushDestinations: [PushDestinations] = []
    @Published var sheetDestination: SheetDestinations?
    @Published var fullScreenDestination: FullScreenDestinations?

    private func resetContent() {
        pushDestinations = []
        sheetDestination = nil
        fullScreenDestination = nil
    }
}

// MARK: Navigation

extension Router {
    func navigate(to destination: Destination) {
        
    }
}
