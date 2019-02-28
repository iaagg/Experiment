//
//  Storage.swift
//  Test URLs
//
//  Created by Alexey Getman on 27/02/2019.
//  Copyright © 2019 Alexey Getman. All rights reserved.
//

import Foundation

struct AddressBookRecordDto: Codable {
    var identifier: String
    var country: String
    var name: String
    var surname: String
    var address: String

    init(identifier: String, country: String = "", name: String, surname: String, address: String = "") {
        self.identifier = identifier
        self.country = country
        self.name = name
        self.surname = surname
        self.address = address
    }
}

final class Storage {
    static let shared = Storage()

    func fetchPeople(count: Int) -> Data {
        let people = (0..<count).map { AddressBookRecordDto(identifier: "\($0)", name: "Name \($0)", surname: "Surname \($0)")  }
        return try! JSONEncoder().encode(people)
    }
}
