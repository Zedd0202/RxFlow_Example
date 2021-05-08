//
//  BaseViewController.swift
//  RxFlow_Example
//
//  Created by Zedd on 2021/05/08.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    deinit {
        print("💡 deinit \(type(of: self))")
    }

}
