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
    var loginButton: UIButton {get set}
    var registerButton: UIButton {get set}
}


class WelcomeVC: UIViewController, AnyWelcomeVC {
    
    var presenter: AnyWelcomePresenter?
    
    let lgXMiddleYLine = UILayoutGuide()
    let lgYMiddleXLine = UILayoutGuide()
    
    lazy var loginButton: UIButton = {
        let button = appCommonBtn(title: K.AppTexts.loginBtnText, titleColor: K.AppColors.buttonTextPrimary, backgroundColor: K.AppColors.buttonBgPrimary)
        button.addTarget(self, action: #selector(handleLoginBtnTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
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
        setupLayoutGuide()
        setupWelcomText()
        setupButtons()
    }
    
    func setupLayoutGuide() {
        view.addLayoutGuide(lgXMiddleYLine)
        lgXMiddleYLine.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        lgXMiddleYLine.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        lgXMiddleYLine.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        view.addLayoutGuide(lgYMiddleXLine)
        lgYMiddleXLine.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        lgYMiddleXLine.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        layoutGuideYCenter.heightAnchor.constraint(equalToConstant: 0.1).isActive = true
        lgYMiddleXLine.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    func setupWelcomText() {
        view.addSubview(secondaryIntroText)
        secondaryIntroText.widthAnchor.constraint(equalToConstant: 300).isActive = true
        secondaryIntroText.heightAnchor.constraint(equalToConstant: 50).isActive = true
        secondaryIntroText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        secondaryIntroText.bottomAnchor.constraint(equalTo: lgYMiddleXLine.topAnchor).isActive = true
        
        view.addSubview(primaryIntroText)
        primaryIntroText.widthAnchor.constraint(equalToConstant: 300).isActive = true
        primaryIntroText.heightAnchor.constraint(equalToConstant: 50).isActive = true
        primaryIntroText.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        primaryIntroText.bottomAnchor.constraint(equalTo: secondaryIntroText.topAnchor).isActive = true
    }
    
    func setupButtons() {
        view.addSubview(loginButton)
        loginButton.topAnchor.constraint(equalTo: lgYMiddleXLine.bottomAnchor, constant: K.AppSizes.sm).isActive = true
        loginButton.rightAnchor.constraint(equalTo: lgXMiddleYLine.leftAnchor, constant: -K.AppSizes.sm).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(registerButton)
        registerButton.topAnchor.constraint(equalTo: lgYMiddleXLine.bottomAnchor, constant: K.AppSizes.sm).isActive = true
        registerButton.leftAnchor.constraint(equalTo: lgXMiddleYLine.rightAnchor, constant: 0).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

// MARK: - Event Handlers
extension WelcomeVC {
    @objc func handleLoginBtnTapped() {
        print("Login tapped")
        // presenter.router.NavigateToLoginScreen
    }
    
    @objc func handleRegistrationBtnTapped() {
        print("Registration tapped")
        // presenter.router.NavigateToRegistrationScreen
    }
}
