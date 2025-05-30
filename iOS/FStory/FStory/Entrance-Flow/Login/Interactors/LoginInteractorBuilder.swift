//
//  LoginInteractorBuilder.swift
//  FStory
//
//  Created by Mainul Dip on 5/22/25.
//

import Foundation

class LoginInteractorBuilder {
    static func make() -> AnyLoginInteractor {
        // inject loginService() from network
        return LoginInteractor()
    }
}
