//
//  LoginPresenterBuilder.swift
//  FStory
//
//  Created by Mainul Dip on 5/22/25.
//

import Foundation

class LoginPresenterBuilder {
    static func make(loginRouter: AnyLoginRouter, loginInteractor: AnyLoginInteractor) -> AnyLoginPresenter {
        return LoginPresenter(loginRouter: loginRouter, loginInteractor: loginInteractor)
    }
}
