//
//  HomeFlow.swift
//  RxFlow_Example
//
//  Created by Zedd on 2021/04/02.
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
        case .child1IsRequired:
            return self.navigateToChild1()
        case .child2IsRequired:
            return self.navigateToChild2()
        default:
            return .none
        }
    }
    
    private func navigateToChild1() -> FlowContributors {
        let viewController = Child1ViewController()
        self.rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor: .contribute(withNext: viewController))
    }
    
    private func navigateToChild2() -> FlowContributors {
        let viewController = Child2ViewController()
        self.rootViewController.pushViewController(viewController, animated: true)
        return .one(flowContributor: .contribute(withNext: viewController))
    }
}
