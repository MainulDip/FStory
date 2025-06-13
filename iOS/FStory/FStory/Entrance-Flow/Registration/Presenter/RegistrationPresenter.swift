//
//  RegistrationPresenter.swift
//  FStory
//
//  Created by Mainul Dip on 6/8/25.
//

import Foundation

protocol AnyRegistrationPresenter: AnyObject {
    var router: AnyRegistrationRouter { get set }
    var interactor: AnyRegistrationInteractor { get set }
    func viewDidLoad()
    func didTapLogin()
    func didTapRegister()
}


class RegistrationPresenter: AnyRegistrationPresenter {
    var router: AnyRegistrationRouter
    var interactor: AnyRegistrationInteractor
    
    init(router: AnyRegistrationRouter, interactor: AnyRegistrationInteractor) {
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        
    }
    
    func didTapLogin() {
        let _ = router.present(vcOrRouter: .presentLogin)
    }
    
    func didTapRegister() {
        
    }
    
    
}
