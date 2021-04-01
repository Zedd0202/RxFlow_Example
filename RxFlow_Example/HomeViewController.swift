//
//  HomeViewController.swift
//  RxFlow_Example
//
//  Created by Zedd on 2021/04/01.
//

import UIKit
import RxFlow
import RxCocoa

class HomeViewController: UIViewController, Stepper {

    var steps = PublishRelay<Step>()
    
    var button: UIButton = {
        let button = UIButton()
        button.setTitle("로그아웃", for: .normal)
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(logoutButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        self.view.backgroundColor = .systemBackground

        self.view.addSubview(self.button)
        self.button.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    @objc
    func logoutButtonDidTap() {
        self.steps.accept(DemoStep.loginIsRequired)
    }
}
