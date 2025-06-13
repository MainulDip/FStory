//
//  LoginViewBuilder.swift
//  FStory
//
//  Created by Mainul Dip on 5/22/25.
//

import Foundation

class LoginVCBuilder {
    static func make(loginRouter: AnyLoginRouter) -> LoginVC {
        let loginVC = LoginVC()
        let loginInteractor = LoginInteractorBuilder.make()
        let loginPresenter = LoginPresenterBuilder.make(
            loginRouter: loginRouter,
            loginInteractor: loginInteractor
        )
        loginVC.presenter = loginPresenter
        print("loginVC.presenter = loginPresenter")
        return loginVC
    }
}
