//
//  LoginPresenterBuilder.swift
//  FStory
//
//  Created by Mainul Dip on 5/22/25.
//

import Foundation

class LoginPresenterBuilder {
    static func make(loginRouter: AnyLoginRouter, loginVC: AnyLoginVC, loginInteractor: AnyLoginInteractor) -> AnyLoginPresenter {
        return LoginPresenter(loginRouter: loginRouter, loginVC: loginVC, loginInteractor: loginInteractor)
    }
}
