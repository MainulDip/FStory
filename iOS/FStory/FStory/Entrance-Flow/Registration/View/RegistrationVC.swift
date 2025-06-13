//
//  RegistrationVC.swift
//  FStory
//
//  Created by Mainul Dip on 6/8/25.
//

import Foundation
import UIKit

protocol AnyRegistrationVC: AnyObject {
    var presenter: AnyRegistrationPresenter? { get set }
}

class RegistrationVC: UIViewController, AnyRegistrationVC {
    var presenter: AnyRegistrationPresenter?
    
    lazy var guide = centerXYLayoutGuide(containerView: self.view)
    
    lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    lazy var loginBtn: OnboardingButton = {
        let btn = appCommonBtn(title: K.AppTexts.loginBtnText, titleColor: K.AppColors.buttonTextPrimary, backgroundColor: K.AppColors.buttonBgPrimary)
        btn.addTarget(self, action: #selector(handleLoginBtnTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var loginRatherText: UITextView = {
        let tv = UITextView()
        tv.textAlignment = .center
        tv.textColor = K.AppColors.textPrimary
        tv.text = K.AppTexts.loginOnboardingText
        tv.isScrollEnabled = false
        tv.backgroundColor = .clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    lazy var registrationBtn: OnboardingButton = {
        let btn = appCommonBtn(title: K.AppTexts.regBtnText, titleColor: K.AppColors.buttonTextPrimary, backgroundColor: K.AppColors.buttonBgPrimary)
        btn.addTarget(self, action: #selector(handleRegistrationBtnTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        setupLayout()
    }
}

extension RegistrationVC {
    @objc func handleRegistrationBtnTapped() {
        print("Registration btn tapped")
        presenter?.didTapRegister()
    }
    
    @objc func handleLoginBtnTapped() {
        presenter?.didTapLogin()
    }
}

// MARK: Layout Setup
extension RegistrationVC {
    func setupLayout() {
        setupLoginFormViews()
        setupRegistrationBtnLayout()
        setupLoginBtnLayout()
    }
    
    func setupLoginFormViews() {
        view.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.bottomAnchor.constraint(equalTo: guide.yMiddleXLine.topAnchor, constant: -K.AppSizes.sm),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            passwordTextField.heightAnchor.constraint(equalToConstant: K.AppSizes.xl)
        ])
        
        view.addSubview(passwordLabel)
        NSLayoutConstraint.activate([
            passwordLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -K.AppSizes.xs),
            passwordLabel.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor)
            
        ])
        
        view.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.bottomAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: -K.AppSizes.sm),
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            emailTextField.heightAnchor.constraint(equalToConstant: K.AppSizes.xl)
        ])
        
        view.addSubview(emailLabel)
        NSLayoutConstraint.activate([
            emailLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -K.AppSizes.xs),
            emailLabel.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor)
        ])
    }
    
    func setupRegistrationBtnLayout() {
        view.addSubview(registrationBtn)
        NSLayoutConstraint.activate([
            registrationBtn.topAnchor.constraint(equalTo: guide.yMiddleXLine.bottomAnchor),
            registrationBtn.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor)
        ])
    }
    
    func setupLoginBtnLayout() {
        view.addSubview(loginRatherText)
        NSLayoutConstraint.activate([
            loginRatherText.topAnchor.constraint(equalTo: registrationBtn.bottomAnchor, constant: K.AppSizes.md),
            loginRatherText.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor)
        ])
        
        view.addSubview(loginBtn)
        NSLayoutConstraint.activate([
            loginBtn.topAnchor.constraint(equalTo: loginRatherText.bottomAnchor, constant: K.AppSizes.xs),
            loginBtn.rightAnchor.constraint(equalTo: loginRatherText.rightAnchor)
        ])
    }
}
