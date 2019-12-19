//
//  ViewController.swift
//  Swift-Sample-BackgroundTask
//
//  Created by nobuy on 2019/12/17.
//  Copyright © 2019 A10 Lab Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let userDefaults = UserDefaults.standard
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .black
        label.numberOfLines = 10
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        label.text = userDefaults.object(forKey: "Log") as? String

        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

