//
//  ViewController.swift
//  Test URLs
//
//  Created by Alexey Getman on 27/02/2019.
//  Copyright © 2019 Alexey Getman. All rights reserved.
//

import UIKit

public final class ViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    private let viewModel = ViewModel()

    public static func instantiate() -> ViewController {
        return UIStoryboard(name: "Main", bundle: Configuration.bundle).instantiateInitialViewController() as! ViewController
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onShouldReload = { [weak tableView] in tableView?.reloadData() }
        viewModel.viewDidLoad()
    }
}

extension ViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell") as! TestCell
        let model = viewModel.cellModel(for: indexPath)
        cell.update(with: model)
        return cell
    }
}

