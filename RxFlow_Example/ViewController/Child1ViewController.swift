//
//  Child1ViewController.swift
//  RxFlow_Example
//
//  Created by Zedd on 2021/04/02.
//

import UIKit
import RxFlow
import RxCocoa

class Child1ViewController: UIViewController, Stepper {

    var steps = PublishRelay<Step>()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
