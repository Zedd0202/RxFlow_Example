//
//  SettingsViewController.swift
//  RxFlow_Example
//
//  Created by Zedd on 2021/05/05.
//

import UIKit
import RxFlow
import RxRelay

class SettingsViewController: BaseViewController, Stepper {
    
    var steps = PublishRelay<Step>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
    }
}
