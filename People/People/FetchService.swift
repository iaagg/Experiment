//
//  FetchService.swift
//  Test URLs
//
//  Created by Alexey Getman on 27/02/2019.
//  Copyright © 2019 Alexey Getman. All rights reserved.
//

import Foundation

final class FetchService {

    func fetchPeople(completion: @escaping ([Person]) -> Void) {
        let url = URL(string: "people://all?count=10")!
        InternalFetcher.shared.fetch(url: url) { data in
            guard let data = data else { return completion([]) }
            do {
                let people = try JSONDecoder().decode([Person].self, from: data)
                completion(people)
            } catch {
                print(error)
            }
        }
    }
}
