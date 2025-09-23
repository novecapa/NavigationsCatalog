//
//  DeepLinkParser.swift
//  NavigationsCatatog
//
//  Created by Josep Cerdá Penadés on 23/9/25.
//

import Foundation

struct DeepLinkParser {
    let parse: (URL) -> Destination?
}

extension URL {
    var fullComponents: [String] {
        guard let scheme else { return [] }

        return absoluteString
            .replacingOccurrences(of: "\(scheme)://", with: "")
            .split(separator: "/")
            .map { String($0) }
    }
}

extension DeepLinkParser {
    static func equal(to components: [String], destination: Destination) -> Self {
        .init { url in
            guard url.fullComponents == components else { return nil }
            return destination
        }
    }
}
