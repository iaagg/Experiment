//
//  InternalFetcher.swift
//  Test URLs
//
//  Created by Alexey Getman on 28/02/2019.
//  Copyright © 2019 Alexey Getman. All rights reserved.
//

import Foundation

final class InternalFetcher {
    func setURLProtocols(_ protocols: [AnyClass]) {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = protocols
        session = URLSession(configuration: config)
    }

    static let shared = InternalFetcher()

    private var session: URLSession?

    func fetch(url: URL, completion: @escaping (Data?) -> Void) {
        let task = session?.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                completion(data)
            }
        }
        task?.resume()
    }
}
