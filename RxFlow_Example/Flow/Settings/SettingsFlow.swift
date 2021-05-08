//
//  SettingFlow.swift
//  RxFlow_Example
//
//  Created by Zedd on 2021/05/05.
//

import Foundation
import RxFlow

class SettingsFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }

    private var rootViewController: SettingsViewController

    init() {
        self.rootViewController = SettingsViewController()
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? DemoStep else { return .none } 
        switch step {
        case .settingsIsRequired:
            return self.navigateToSettings()
        case .profileIsRequired:
            return self.navigateToProfile()
        default:
            return .none
        }
    }
    
    private func navigateToSettings() -> FlowContributors {
        return .one(flowContributor: .contribute(withNextPresentable: rootViewController, withNextStepper: OneStepper(withSingleStep: DemoStep.settingsIsRequired)))
    }
    
    private func navigateToProfile() -> FlowContributors {
        let viewController = ProfileViewController()
        (rootViewController.parent as? UINavigationController)?.pushViewController(viewController, animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: OneStepper(withSingleStep: DemoStep.profileIsRequired)))
    }
}
