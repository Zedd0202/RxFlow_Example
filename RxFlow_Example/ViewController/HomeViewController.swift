//
//  HomeViewController.swift
//  RxFlow_Example
//
//  Created by Zedd on 2021/04/01.
//

import UIKit
import RxFlow
import RxRelay

class HomeViewController: BaseViewController, Stepper {

    var steps = PublishRelay<Step>()
    
    var logoutButton: UIButton = {
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

        self.view.addSubview(self.logoutButton)
        self.logoutButton.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        let settingButton = UIBarButtonItem(title: "설정", style: .plain, target: self, action: #selector(settingButtonDidTap))
        self.navigationItem.rightBarButtonItem = settingButton
    }
    
    @objc
    func logoutButtonDidTap() {
        self.steps.accept(DemoStep.loginIsRequired)
    }
    
    @objc
    func settingButtonDidTap() {
        self.steps.accept(DemoStep.settingsIsRequired)
    }
}
