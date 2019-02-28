//
//  ViewModel.swift
//  Test URLs
//
//  Created by Alexey Getman on 27/02/2019.
//  Copyright © 2019 Alexey Getman. All rights reserved.
//

import Foundation

final class ViewModel {
    private let service = FetchService()

    private var people = [Person]() {
        didSet {
            onShouldReload?()
        }
    }
    var onShouldReload: (() -> Void)?

    func viewDidLoad() {
        fetchItems { [weak self] people in
            self?.people = people
        }
    }

    var numberOfItems: Int {
        return people.count
    }

    func cellModel(for indexPath: IndexPath) -> TestCell.ViewModel {
        let person = people[indexPath.row]
        return .init(title: person.name, subtitle: person.surname)
    }

    private func fetchItems(completion: @escaping ([Person]) -> Void) {
        service.fetchPeople(completion: completion)
    }
}
