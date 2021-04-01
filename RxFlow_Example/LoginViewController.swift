//
//  LoginViewController.swift
//  RxFlow_Example
//
//  Created by Zedd on 2021/04/01.
//

import UIKit
import RxFlow
import RxCocoa
import SnapKit

class LoginViewController: UIViewController, Stepper {
    
    var steps = PublishRelay<Step>()
    
    var initialStep: Step {
        DemoStep.homeIsRequired
    }
    
    var button: UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        self.view.backgroundColor = .systemBackground

        self.view.addSubview(self.button)
        self.button.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    @objc
    func loginButtonDidTap() {
        self.steps.accept(DemoStep.homeIsRequired)
    }
}
