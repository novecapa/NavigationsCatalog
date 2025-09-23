//
//  Deeplink.swift
//  NavigationsCatatog
//
//  Created by Josep Cerdá Penadés on 23/9/25.
//

import SwiftUI

struct DeepLink {
    
    enum Constants {
        static let deepLinkScheme = "navigationscatalog"
    }

    static func destination(from url: URL) -> Destination? {
        guard url.scheme == Constants.deepLinkScheme else { return nil }
        for parser in registeredParsers {
            if let destination = parser.parse(url) {
                return destination
            }
        }
        return nil
    }

    static let registeredParsers: [DeepLinkParser] = [
        .equal(to: ["home"], destination: .tab(.home)),
        .equal(to: ["about"], destination: .tab(.about))
        // Whatever...
    ]
}
