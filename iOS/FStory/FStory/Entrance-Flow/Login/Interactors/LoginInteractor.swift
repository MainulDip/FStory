//
//  Interactor.swift
//  FStory
//
//  Created by Mainul Dip on 5/19/25.
//

import Foundation

protocol AnyLoginInteractor {
    var loginPresenter: AnyLoginPresenter? { get set }
    func queryLogin(userCredentials: UserLoginCredentials) -> Bool
}


class LoginInteractor: AnyLoginInteractor {
    var loginPresenter: AnyLoginPresenter?
    
    func queryLogin(userCredentials: UserLoginCredentials) -> Bool {
        return true
    }
}




// For REgistration Module

//protocol AnyUserRegistrationQuery {
//    func userRegistrationQuery(user: User) -> Bool
//}
