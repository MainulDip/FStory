//
//  WelcomeInteractor.swift
//  FStory
//
//  Created by Mainul Dip on 5/23/25.
//

import Foundation

protocol AnyWelcomeInteractor {
    var welcomeRouter: AnyWelcomeRouter? { get set }
    static func userAuthStatus() -> UserAuthStatus
}

class WelcomeInteractor: AnyWelcomeInteractor {
    var welcomeRouter: AnyWelcomeRouter?
    
    static func userAuthStatus() -> UserAuthStatus {
        userSharedStorageQuery()
        return .isFirstTimeInstall
    }
    
    static func userSharedStorageQuery() {
        print("quering shared storage")
    }
}

enum UserAuthStatus {
    case isFirstTimeInstall
    case isLoggedIn
    case isNotLoggedIn
    
    // this func should be called from View (VC)
    func checkLoggedInStatus(_ userLoggedInStatus: UserAuthStatus) {
        switch userLoggedInStatus {
        case .isFirstTimeInstall:
            print("Show Welcome Screen")
        case .isLoggedIn:
            print("Show Home Screen")
        case .isNotLoggedIn:
            print("Show Login Screen")
        }
    }
}
