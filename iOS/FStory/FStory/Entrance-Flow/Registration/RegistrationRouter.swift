//
//  RegistrationRouter.swift
//  FStory
//
//  Created by Mainul Dip on 6/8/25.
//

import Foundation
import UIKit

protocol AnyRegistrationRouter: AnyObject {
    var navigationController: UINavigationController { get set }
    init(navigationController: UINavigationController)
    func present(vcOrRouter: RegistrationRouterNavigationEnum)
//    func presentCurrentVC()
//    func presentRegistrationVC() // RegistrationRouter(navigationController).presentCurrentVC()
//    func presentHomeVC()
    // navigationController.pushViewController(HomeViewControllerBuilder.make(router: self), animated: true)
}

enum RegistrationRouterNavigationEnum {
    case presentCurrentVC
    case presentLogin
}


class RegistrationRouter: AnyRegistrationRouter {
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        present(vcOrRouter: .presentCurrentVC)
    }
    
    func present(vcOrRouter: RegistrationRouterNavigationEnum) {
        switch vcOrRouter {
        case .presentCurrentVC:
            print("Present Login")
            let registrationVC = RegistrationVCBuilder.make(router: self)
            navigationController.setViewControllers( [registrationVC], animated: true)
//            navigationController.popToViewController(registrationVC, animated: true)
//            navigationController.pushViewController(registrationVC, animated: true)
        case .presentLogin:
            print("present Home")
            let _ = LoginRouter(navigationController: navigationController)
        }
    }
}
