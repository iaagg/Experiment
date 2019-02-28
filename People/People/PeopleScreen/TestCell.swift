//
//  TestCell.swift
//  Test URLs
//
//  Created by Alexey Getman on 27/02/2019.
//  Copyright © 2019 Alexey Getman. All rights reserved.
//

import UIKit

final class TestCell: UITableViewCell {
    struct ViewModel {
        let title: String
        let subtitle: String
    }

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!

    func update(with model: ViewModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
    }
}
