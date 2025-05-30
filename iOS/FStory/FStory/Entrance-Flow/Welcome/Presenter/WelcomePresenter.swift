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
    var welcomeVC: AnyWelcomeVC { get set }
}

class WelcomePresenter: AnyWelcomePresenter {
    var router: AnyWelcomeRouter
    var welcomeInteractor: AnyWelcomeInteractor
    var welcomeVC: AnyWelcomeVC
    
    init(router: AnyWelcomeRouter, welcomeInteractor: AnyWelcomeInteractor, welcomeVC: AnyWelcomeVC) {
        self.router = router
        self.welcomeInteractor = welcomeInteractor
        self.welcomeVC = welcomeVC
    }
}
