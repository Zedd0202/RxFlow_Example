//
//  LoginFlow.swift
//  RxFlow_Example
//
//  Created by Zedd on 2021/04/02.
//

import Foundation
import RxFlow

class LoginFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }

    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()

    init() {}

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DemoStep else { return .none }
        switch step {
        case .loginIsRequired:
            return self.navigateToLogin()
        case .homeIsRequired:
            return .end(forwardToParentFlowWithStep: DemoStep.homeIsRequired)
        default:
            return .none
        }
    }
    
    private func navigateToLogin() -> FlowContributors {
        let viewController = LoginViewController()
        self.rootViewController.setViewControllers([viewController], animated: false)
        return .one(flowContributor: .contribute(withNext: viewController))
    }
}

