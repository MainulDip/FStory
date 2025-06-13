//
//  RegistrationPresenterBuilder.swift
//  FStory
//
//  Created by Mainul Dip on 6/8/25.
//

import Foundation

class RegistrationPresenterBuilder {
    static func make(router: AnyRegistrationRouter, interactor: AnyRegistrationInteractor) -> AnyRegistrationPresenter {
        return RegistrationPresenter(router: router, interactor: interactor)
    }
}
