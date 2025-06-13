//
//  WelcomeVC.swift
//  FStory
//
//  Created by Mainul Dip on 5/23/25.
//

import Foundation
import UIKit

protocol AnyWelcomeVC {
    var presenter: AnyWelcomePresenter? { get set }
    var loginButton: OnboardingButton {get set}
    var registerButton: OnboardingButton {get set}
}


class WelcomeVC: UIViewController, AnyWelcomeVC {
    
    var presenter: AnyWelcomePresenter?
    
    lazy var guide = centerXYLayoutGuide(containerView: self.view)
    
    lazy var loginButton: OnboardingButton = {
        let button = appCommonBtn(title: K.AppTexts.loginBtnText, titleColor: K.AppColors.buttonTextPrimary, backgroundColor: K.AppColors.buttonBgPrimary)
        button.addTarget(self, action: #selector(handleLoginBtnTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: OnboardingButton = {
        let button = appCommonBtn(title: K.AppTexts.regBtnText, titleColor: K.AppColors.buttonTextPrimary, backgroundColor: K.AppColors.buttonBgPrimary)
        button.addTarget(self, action: #selector(handleRegistrationBtnTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var primaryIntroText: UITextView = {
        let textView = UITextView()
        textView.text = K.AppTexts.welcomeTitle
        textView.backgroundColor = .clear
        textView.textColor = K.AppColors.textPrimary
        textView.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    lazy var secondaryIntroText: UITextView = {
        let textView = UITextView()
        textView.text = K.AppTexts.subWelcomeTitle
        textView.backgroundColor = .clear
        textView.textColor = K.AppColors.textSecondary
        textView.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Been called")
        view.backgroundColor = K.AppColors.background
        setupLayout()
    }
}

extension WelcomeVC {
    func setupLayout() {
        setupWelcomText()
        setupButtons()
    }
    
    func setupWelcomText() {
        view.addSubview(secondaryIntroText)
//        secondaryIntroText.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        secondaryIntroText.heightAnchor.constraint(equalToConstant: 50).isActive = true
        secondaryIntroText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        secondaryIntroText.bottomAnchor.constraint(equalTo: guide.yMiddleXLine.topAnchor).isActive = true
        
        view.addSubview(primaryIntroText)
//        primaryIntroText.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        primaryIntroText.heightAnchor.constraint(equalToConstant: 50).isActive = true
        primaryIntroText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        primaryIntroText.bottomAnchor.constraint(equalTo: secondaryIntroText.topAnchor).isActive = true
    }
    
    func setupButtons() {
        view.addSubview(loginButton)
        loginButton.topAnchor.constraint(equalTo: guide.yMiddleXLine.bottomAnchor, constant: K.AppSizes.sm).isActive = true
        loginButton.rightAnchor.constraint(equalTo: guide.xMiddleYLine.leftAnchor, constant: -K.AppSizes.sm).isActive = true
        
        view.addSubview(registerButton)
        registerButton.topAnchor.constraint(equalTo: guide.yMiddleXLine.bottomAnchor, constant: K.AppSizes.sm).isActive = true
        registerButton.leftAnchor.constraint(equalTo: guide.xMiddleYLine.rightAnchor, constant: 0).isActive = true
    }
}

// MARK: - Event Handlers
extension WelcomeVC {
    @objc func handleLoginBtnTapped() {
        print("Login tapped")
        presenter?.presentLogin()
        // presenter.router.NavigateToLoginScreen
    }
    
    @objc func handleRegistrationBtnTapped() {
        print("Registration tapped")
        presenter?.presentRegistration()
        // presenter.router.NavigateToRegistrationScreen
    }
}
