//
//  LoginStepper.swift
//  RxFlow_Example
//
//  Created by Zedd on 2021/04/04.
//

import Foundation
import RxFlow
import RxRelay

class LoginStepper: Stepper {

    let steps = PublishRelay<Step>()

    init() {
    }

    var initialStep: Step {
        return DemoStep.loginIsRequired
    }
}
