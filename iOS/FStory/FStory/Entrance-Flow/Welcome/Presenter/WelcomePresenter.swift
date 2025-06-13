//
//  WelcomePresenter.swift
//  FStory
//
//  Created by Mainul Dip on 5/28/25.
//

import Foundation

protocol AnyWelcomePresenter: AnyObject {
    var router: AnyWelcomeRouter { get set }
    var welcomeInteractor: AnyWelcomeInteractor { get set }
    func presentLogin()
    func presentRegistration()
}

class WelcomePresenter: AnyWelcomePresenter {
    var router: AnyWelcomeRouter
    var welcomeInteractor: AnyWelcomeInteractor
    
    init(router: AnyWelcomeRouter, welcomeInteractor: AnyWelcomeInteractor) {
        self.router = router
        self.welcomeInteractor = welcomeInteractor
    }
    
    func presentLogin() {
        router.present(vcOrRouter: .presentLogin)
    }
    
    func presentRegistration() {
        router.present(vcOrRouter: .presentRegistration)
    }
}
