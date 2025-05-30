//
//  Router.swift
//  FStory
//
//  Created by Mainul Dip on 5/19/25.
//

import Foundation
import UIKit

protocol AnyLoginRouter: AnyObject {
    var navigationController: UINavigationController { get set }
    init(navigationController: UINavigationController)
    func present(vcOrRouter: LoginRouterNavigationEnum)
//    func presentCurrentVC()
//    func presentRegistrationVC() // RegistrationRouter(navigationController).presentCurrentVC()
//    func presentHomeVC()
    // navigationController.pushViewController(HomeViewControllerBuilder.make(router: self), animated: true)
}

enum LoginRouterNavigationEnum {
    case presentCurrentVC
    case presentRegistration
    case presentHome
}


class LoginRouter: AnyLoginRouter {
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        present(vcOrRouter: .presentCurrentVC)
    }
    
    func present(vcOrRouter: LoginRouterNavigationEnum) {
        switch vcOrRouter {
        case .presentCurrentVC:
            print("Present Login")
            // navigationController.push -> LoginVCBuilder
        case .presentRegistration:
            print("present Reg")
            // RegistrationRouter(navigationController)
        case .presentHome:
            print("present Home")
            // navigationController.push(HomeVCBuilder.make)
        }
    }
}
