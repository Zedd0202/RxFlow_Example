//
//  DemoStep.swift
//  RxFlow_Example
//
//  Created by Zedd on 2021/04/01.
//

import Foundation
import RxFlow

struct AppServices {
    
}
enum DemoStep: Step {
    
    case loginIsRequired    
    case homeIsRequired
}

class OnboardingFlow: Flow {
    
    var root: Presentable {
        return self.rootViewController
    }

    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        viewController.navigationBar.topItem?.title = "OnBoarding"
        return viewController
    }()

    private let services: AppServices

    init(withServices services: AppServices) {
        self.services = services
    }

    deinit {
        print("\(type(of: self)): \(#function)")
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DemoStep else { return .none }
        switch step {
        case .loginIsRequired:
            return navigationToLoginScreen()
        case .homeIsRequired:
            return navigationToHomeScreen()
        }
    }

    private func navigationToLoginScreen() -> FlowContributors {
        let viewController = LoginViewController()
        viewController.title = "Login"
        self.rootViewController.pushViewController(viewController, animated: false)
        return .one(flowContributor: .contribute(withNext: viewController))
    }

    private func navigationToHomeScreen() -> FlowContributors {
        let viewController = HomeViewController()
        viewController.title = "Home"
        self.rootViewController.pushViewController(viewController, animated: false)
        return .one(flowContributor: .contribute(withNext: viewController))
    }
}
