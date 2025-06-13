//
//  RegistrationVCBuilder.swift
//  FStory
//
//  Created by Mainul Dip on 6/8/25.
//

import Foundation

class RegistrationVCBuilder {
    static func make(router: AnyRegistrationRouter) -> RegistrationVC {
        let viewController = RegistrationVC()
        let interactor = RegistrationInteractorBuilder.make()
        let presenter = RegistrationPresenterBuilder.make(router: router, interactor: interactor)
        viewController.presenter = presenter
        return viewController
    }
}
