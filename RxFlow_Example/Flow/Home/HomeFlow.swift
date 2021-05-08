//
//  HomeFlow.swift
//  RxFlow_Example
//
//  Created by Zedd on 2021/04/04.
//

import Foundation
import RxFlow

class HomeFlow: Flow {
    
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
        case .homeIsRequired:
            return self.navigateToHome()
        case .loginIsRequired:
            return .end(forwardToParentFlowWithStep: DemoStep.loginIsRequired)
        case .settingsIsRequired:
            return self.navigateToSettings()
        default:
            return .none
        }
    }
    
    private func navigateToHome() -> FlowContributors {
        let viewController = HomeViewController()
        self.rootViewController.setViewControllers([viewController], animated: false)
        return .one(flowContributor: .contribute(withNext: viewController))
    }
    
    private func navigateToSettings() -> FlowContributors {
        let settingsFlow = SettingsFlow()
        Flows.use(settingsFlow, when: .created) { [unowned self] (root: UIViewController) in
            self.rootViewController.pushViewController(root, animated: true)
        }
        return .multiple(flowContributors: [
            .contribute(withNextPresentable: settingsFlow, withNextStepper: OneStepper(withSingleStep: DemoStep.settingsIsRequired)),
            .contribute(withNextPresentable: settingsFlow, withNextStepper: OneStepper(withSingleStep: DemoStep.profileIsRequired))
        ])
    }
}

