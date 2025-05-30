//
//  Presenter.swift
//  FStory
//
//  Created by Mainul Dip on 5/19/25.
//

import Foundation

protocol AnyLoginPresenter: AnyObject {
    var loginRouter: AnyLoginRouter { get set }
    var loginVC: AnyLoginVC { get set }
    var loginInteractor: AnyLoginInteractor { get set }
}

class LoginPresenter: AnyLoginPresenter {
    var loginRouter: AnyLoginRouter
    var loginVC: AnyLoginVC
    var loginInteractor: AnyLoginInteractor
    
    init(loginRouter: AnyLoginRouter, loginVC: AnyLoginVC, loginInteractor: AnyLoginInteractor) {
        self.loginRouter = loginRouter
        self.loginVC = loginVC
        self.loginInteractor = loginInteractor
    }
}
