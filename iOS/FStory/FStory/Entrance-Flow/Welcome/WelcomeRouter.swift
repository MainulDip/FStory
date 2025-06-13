//
//  WelcomeRouter.swift
//  FStory
//
//  Created by Mainul Dip on 5/23/25.
//

import Foundation
import UIKit

protocol AnyWelcomeRouter: AnyObject {
    var navigationController: UINavigationController { get set }
    init()
    func present(vcOrRouter: WelcomeRouterNavigationEnum)
//    func presentCurrentVC()
//    func navigateToLoginRouter()
//    func navigateToRegistrationRouter()
//    func navigateToHome()
}

enum WelcomeRouterNavigationEnum {
    case presentCurrentVC
    case presentLogin
    case presentRegistration
    case presentHome
}

class WelcomeRouter: AnyWelcomeRouter {

    var navigationController: UINavigationController
    
    required init() {
        self.navigationController = UINavigationController()
        let userCurrentAuthState = WelcomeInteractor.userAuthStatus()
        switch userCurrentAuthState {
        case .isFirstTimeInstall:
            present(vcOrRouter: .presentCurrentVC)
        case .isLoggedIn:
            present(vcOrRouter: .presentHome)
        case .isNotLoggedIn:
            present(vcOrRouter: .presentLogin)
        }
    }
    
    func present(vcOrRouter: WelcomeRouterNavigationEnum) {
        switch vcOrRouter {
        case .presentCurrentVC:
            presentCurrentVC()
        case .presentLogin:
            navigateToLoginRouter()
        case .presentRegistration:
            navigateToRegistrationRouter()
        case .presentHome:
            navigateToHome()
        }
    }
    
    private func presentCurrentVC() {
        let welcomeVC = WelcomeVCBuilder.make(router: self)
        navigationController.pushViewController(welcomeVC, animated: true)
        print("showing current View Controller as WelcomViewContrller")
    }
    
    private func navigateToLoginRouter() {
        // testing perpose, use LoginVCBuilder via LoginRouter, all navigation should happen through routers
        let _ = LoginRouter(navigationController: navigationController)
    }
    
    private func navigateToRegistrationRouter() {
        let _ = RegistrationRouter(navigationController: navigationController)
    }
    
    private func navigateToHome() {
        print("show HomeViewController")
    }
}
