//
//  File.swift
//  FStory
//
//  Created by Mainul Dip on 5/28/25.
//

import Foundation

class WelcomeVCBuilder {
    static func make(router: AnyWelcomeRouter) -> WelcomeVC {
        let vc = WelcomeVC()
        let interactor = WelcomeInteractor()
        let presenter = WelcomePresenter(router: router, welcomeInteractor: interactor)
        vc.presenter = presenter
        return vc
    }
    
    private init(){}
}
