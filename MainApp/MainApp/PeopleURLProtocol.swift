//
//  PeopleURLProtocol.swift
//  Test URLs
//
//  Created by Alexey Getman on 27/02/2019.
//  Copyright © 2019 Alexey Getman. All rights reserved.
//

import Foundation

final class PeopleURLProtocol: URLProtocol {
    var count: Int {
        guard
            let urlComponents = URLComponents(url: request.url!,
                                                resolvingAgainstBaseURL: false)
            else { return 0 }
        guard let countItem = urlComponents.queryItems?[0].value else { return 0 }
        return Int(countItem) ?? 0
    }

    override class func canInit(with request: URLRequest) -> Bool {
        guard request.url?.scheme == "people" else {
            return super.canInit(with: request)
        }

        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        let data = Storage.shared.fetchPeople(count: count)
        let response = URLResponse(url: request.url!,
                                   mimeType: "application/json",
                                   expectedContentLength: data.count,
                                   textEncodingName: nil)
        client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
        client?.urlProtocol(self, didLoad: data)
        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {
        print("stop loading")
    }
}
