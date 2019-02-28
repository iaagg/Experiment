//
//  ViewController.swift
//  Test URLs
//
//  Created by Alexey Getman on 27/02/2019.
//  Copyright © 2019 Alexey Getman. All rights reserved.
//

import UIKit
import People

class ViewController: UIViewController {
    @IBAction private func openPeopleModule() {
        navigationController?.pushViewController(People.ViewController.instantiate(), animated: true)
    }
}

