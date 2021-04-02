//
//  AppStepper.swift
//  RxFlow_Example
//
//  Created by Zedd on 2021/04/01.
//

import Foundation
import RxFlow
import RxCocoa
import RxSwift

class AppStepper: Stepper {

    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    init() {
    }

    var initialStep: Step {
        return DemoStep.loginIsRequired
    }
}
