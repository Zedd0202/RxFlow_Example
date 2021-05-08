//
//  HomeStepper.swift
//  RxFlow_Example
//
//  Created by Zedd on 2021/05/08.
//

import Foundation
import RxFlow
import RxRelay

class HomeStepper: Stepper {

    let steps = PublishRelay<Step>()

    init() {
    }

    var initialStep: Step {
        return DemoStep.homeIsRequired
    }
}

