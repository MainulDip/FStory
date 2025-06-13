//
//  RegistrationInteractorBuilder.swift
//  FStory
//
//  Created by Mainul Dip on 6/8/25.
//

import Foundation

class RegistrationInteractorBuilder {
    static func make() -> AnyRegistrationInteractor {
        // inject APIService if needed
        return RegistrationInteractor()
    }
}
