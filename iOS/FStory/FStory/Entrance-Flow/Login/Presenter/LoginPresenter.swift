//
//  Presenter.swift
//  FStory
//
//  Created by Mainul Dip on 5/19/25.
//

import Foundation
import Combine

protocol AnyLoginPresenter: AnyObject {
    var loginRouter: AnyLoginRouter { get set }
    var loginInteractor: AnyLoginInteractor { get set }
    func viewDidLoad()
    func didTapLogin()
    func didTapRegister()
}

enum LoginError: Error {
    case emptyEmail(String = "Email can't be empty")
    case emptyPassword(String = "Password can't be empty")
    case invalidCombination(String = "Invalid email or password or both")
}

enum RegistrationError {
    enum EmailError: Error {
        case invalidEmail(String = "Invalid email format")
        case alreadyExist(String = "Email already exist")
    }
    
    enum PasswordError: Error {
        case invalidPassword(String = "Password needs to be at least of 8 characters")
    }
}

class LoginPresenter: AnyLoginPresenter, ObservableObject {
    var loginRouter: AnyLoginRouter
    var loginInteractor: AnyLoginInteractor
    
    var userCredentialState = UserLoginCredential(email: "", password: "")
    var loginBtnState: Bool = false
    @Published var credentialValidationState: Bool = false
    
    var canclables: [AnyCancellable] = []
    
    init(loginRouter: AnyLoginRouter, loginInteractor: AnyLoginInteractor) {
        self.loginRouter = loginRouter
        self.loginInteractor = loginInteractor
    }
}

extension LoginPresenter {
    func viewDidLoad() {
//        loginInteractor.queryLogin(userCredentials: UserLoginCredential(email: "", password: ""))
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: { error in
//                print("\(error)")
//            }, receiveValue: { number in
//                print(number)
//            })
//            .store(in: &canclables)
    }
    
    func didTapLogin() {
        
    }
    
    func didTapRegister() {
        loginRouter.present(vcOrRouter: .presentRegistration)
    }
}
