//
//  Configuration.swift
//  People
//
//  Created by Alexey Getman on 28/02/2019.
//  Copyright © 2019 Alexey Getman. All rights reserved.
//

import Foundation

public final class Configuration {
    static let bundle = Bundle(identifier: "AG.People")

    public static func setupURLProtocols(_ protocols: [AnyClass]) {
        InternalFetcher.shared.setURLProtocols(protocols)
    }
}
