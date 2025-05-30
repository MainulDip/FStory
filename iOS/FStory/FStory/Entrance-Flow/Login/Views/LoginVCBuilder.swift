//
//  LoginViewBuilder.swift
//  FStory
//
//  Created by Mainul Dip on 5/22/25.
//

import Foundation

class LoginVCBuilder {
    static func make(loginRouter: AnyLoginRouter) -> AnyLoginVC {
        let loginVC = LoginVC()
        var loginInteractor = LoginInteractorBuilder.make()
        let loginPresenter = LoginPresenterBuilder.make(
            loginRouter: loginRouter,
            loginVC: loginVC,
            loginInteractor: loginInteractor
        )
        loginVC.presenter = loginPresenter
        loginInteractor.loginPresenter = loginPresenter
        return loginVC
    }
}
