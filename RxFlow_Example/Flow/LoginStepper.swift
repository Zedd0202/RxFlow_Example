//
//  LoginStepper.swift
//  RxFlow_Example
//
//  Created by Zedd on 2021/04/04.
//

import Foundation
import RxFlow
import RxCocoa
import RxSwift

class LoginStepper: Stepper {

    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    init() {
    }

    var initialStep: Step {
        return DemoStep.loginIsRequired
    }
}

class HomeStepper: Stepper {

    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    init() {
    }

    var initialStep: Step {
        return DemoStep.homeIsRequired
    }
}

