//
//  Interactor.swift
//  FStory
//
//  Created by Mainul Dip on 5/19/25.
//

import Foundation
import Combine

protocol AnyLoginInteractor {
    func queryLogin(userCredentials: UserLoginCredential) -> AnyPublisher<Int, Never>
}


class LoginInteractor: AnyLoginInteractor {
    var apiService: APIService?
    
    func queryLogin(userCredentials: UserLoginCredential) -> AnyPublisher<Int, Never> {
        guard let apiService = apiService else {
            fatalError("apiService is nil")
        }
        let requestPublisher = apiService.mockAPIRequestWaiter()
        return requestPublisher
    }
}




// For REgistration Module

//protocol AnyUserRegistrationQuery {
//    func userRegistrationQuery(user: User) -> Bool
//}
