//
//  View.swift
//  FStory
//
//  Created by Mainul Dip on 5/19/25.
//

import Foundation
import UIKit
import Combine

protocol AnyLoginVC: AnyObject {
    var presenter: AnyLoginPresenter? {get set}
    var registrationBtn: OnboardingButton {get set}
}

class LoginVC: UIViewController, AnyLoginVC {
    var presenter: AnyLoginPresenter?
    
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
        tf.placeholder = "Hello"
        tf.addTarget(self, action: #selector(handlePasswordTextFieldEditingChanged), for: .allEvents)
        return tf
    }()
    
    lazy var loginBtn: OnboardingButton = {
        let btn = appCommonBtn(title: K.AppTexts.loginBtnText, titleColor: K.AppColors.buttonTextPrimary, backgroundColor: K.AppColors.buttonBgPrimary)
        btn.addTarget(self, action: #selector(handleLoginBtnTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var createAccountText: UITextView = {
        let tv = UITextView()
        tv.textAlignment = .center
        tv.textColor = K.AppColors.textPrimary
        tv.text = K.AppTexts.regOnboardingText
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
    
    
    lazy var passwordConView = setupPasswordContainerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = K.AppColors.background
        
        print("This is login VC")
        setupLayout()
        let pCon = passwordConView
        passwordConViewAdaptive(conView: pCon)
        
        presenter?.viewDidLoad()
    }
    
    @objc func handlePasswordTextFieldEditingChanged() {
        print("password field tappped")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        if size.width > size.height {
            singleFieldLandscapeConstraintActivation(container: passwordConView, textLabel: passwordLabel, inputField: passwordTextField)
            print("landsape")
        } else {
            singleFieldPortraitConstraintActivation(container: passwordConView, textLabel: passwordLabel, inputField: passwordTextField)
            print("protrait")
        }
    }
}


extension LoginVC {
    @objc func handleRegistrationBtnTapped() {
        print("Registration btn tapped")
        presenter?.didTapRegister()
    }
    
    @objc func handleLoginBtnTapped() {
        
    }
}

// MARK: Layout Setup
extension LoginVC {
    func setupLayout() {
        setupLoginFormViews()
        setupLoginBtn()
        setupRegistraitonBtn()
    }
    
    func setupLoginFormViews() {
        //        setupPasswordContainerView()
        
        //        view.addSubview(emailTextField)
        //        NSLayoutConstraint.activate([
        //            emailTextField.bottomAnchor.constraint(equalTo: passwordLabel.topAnchor, constant: -K.AppSizes.sm),
        //            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //            emailTextField.widthAnchor.constraint(equalToConstant: 300),
        //            emailTextField.heightAnchor.constraint(equalToConstant: K.AppSizes.xl)
        //        ])
        //
        //        view.addSubview(emailLabel)
        //        NSLayoutConstraint.activate([
        //            emailLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -K.AppSizes.xs),
        //            emailLabel.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor)
        //        ])
    }
    
    func setupPasswordContainerView() -> UIView {
        let passwordContainerView: UIView = UIView()
        passwordContainerView.translatesAutoresizingMaskIntoConstraints = false
        passwordContainerView.backgroundColor = .yellow
        view.addSubview(passwordContainerView)
        
        NSLayoutConstraint.activate([
            passwordContainerView.widthAnchor.constraint(equalToConstant: 300),
            passwordContainerView.heightAnchor.constraint(equalToConstant: K.AppSizes.lg * 2),
            passwordContainerView.topAnchor.constraint(equalTo: guide.yMiddleXLine.bottomAnchor),
            passwordContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        passwordContainerView.addSubview(passwordTextField)
        passwordContainerView.addSubview(passwordLabel)
        return passwordContainerView
        
        
        
        
        
        //        NSLayoutConstraint.activate([
        //            passwordLabel.leftAnchor.constraint(equalTo: passwordContainerView.leftAnchor),
        //            passwordLabel.rightAnchor.constraint(equalTo: passwordTextField.leftAnchor, constant: -K.AppSizes.sm),
        //            passwordLabel.centerYAnchor.constraint(equalTo: passwordContainerView.centerYAnchor),
        //            passwordTextField.rightAnchor.constraint(equalTo: passwordContainerView.rightAnchor),
        //            passwordTextField.centerYAnchor.constraint(equalTo: passwordContainerView.centerYAnchor),
        //            passwordTextField.heightAnchor.constraint(equalTo: passwordContainerView.heightAnchor)
        //        ])
        
        
        NSLayoutConstraint.activate([
            //            passwordTextField.bottomAnchor.constraint(equalTo: guide.yMiddleXLine.topAnchor, constant: -K.AppSizes.sm),
            //            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            //            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            //            passwordTextField.heightAnchor.constraint(equalToConstant: K.AppSizes.xl)
        ])
        
        //        view.addSubview(passwordTextField)
        //        NSLayoutConstraint.activate([
        //            passwordTextField.bottomAnchor.constraint(equalTo: guide.yMiddleXLine.topAnchor, constant: -K.AppSizes.sm),
        //            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
        //            passwordTextField.heightAnchor.constraint(equalToConstant: K.AppSizes.xl)
        //        ])
        //
        //        view.addSubview(passwordLabel)
        //        NSLayoutConstraint.activate([
        //            passwordLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -K.AppSizes.xs),
        //            passwordLabel.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor)
        //
        //        ])
    }
    
    func passwordConViewAdaptive(conView: UIView) {
        if view.bounds.width > view.bounds.height {
            singleFieldLandscapeConstraintActivation(container: conView, textLabel: passwordLabel, inputField: passwordTextField)
            print("landsape")
        } else {
            singleFieldPortraitConstraintActivation(container: conView, textLabel: passwordLabel, inputField: passwordTextField)
            print("protrait")
        }
    }
    
    func singleFieldLandscapeConstraintActivation(container: UIView, textLabel: UILabel, inputField: UITextField) {
        NSLayoutConstraint.deactivate([
            textLabel.leftAnchor.constraint(equalTo: container.leftAnchor),
            textLabel.topAnchor.constraint(equalTo: container.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: inputField.topAnchor, constant: -K.AppSizes.xs),
            inputField.rightAnchor.constraint(equalTo: container.rightAnchor),
            inputField.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            inputField.leftAnchor.constraint(equalTo: container.leftAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textLabel.leftAnchor.constraint(equalTo: container.leftAnchor), // common
            textLabel.rightAnchor.constraint(equalTo: inputField.leftAnchor, constant: -K.AppSizes.xs),
            textLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            inputField.rightAnchor.constraint(equalTo: container.rightAnchor),
            inputField.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            inputField.heightAnchor.constraint(equalTo: container.heightAnchor) // common
        ])
    }
    
    func singleFieldPortraitConstraintActivation(container: UIView, textLabel: UILabel, inputField: UITextField) {
        //        NSLayoutConstraint.deactivate([
        //            textLabel.leftAnchor.constraint(equalTo: container.leftAnchor),
        //            textLabel.rightAnchor.constraint(equalTo: inputField.leftAnchor, constant: -K.AppSizes.xs),
        //            textLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
        //            inputField.rightAnchor.constraint(equalTo: container.rightAnchor),
        //            inputField.centerYAnchor.constraint(equalTo: container.centerYAnchor),
        //            inputField.heightAnchor.constraint(equalTo: container.heightAnchor)
        //        ])
        let abc = textLabel.leftAnchor.constraint(equalTo: container.leftAnchor)
        
        NSLayoutConstraint.activate([
            textLabel.leftAnchor.constraint(equalTo: container.leftAnchor), // common
            textLabel.topAnchor.constraint(equalTo: container.topAnchor),
            inputField.leftAnchor.constraint(equalTo: container.leftAnchor),
            inputField.rightAnchor.constraint(equalTo: container.rightAnchor),
            inputField.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: K.AppSizes.xs),
            inputField.heightAnchor.constraint(equalToConstant: K.AppSizes.lg)
        ])
    }
    
    func setupPasswordAdaptiveLayout(labelText: String, labelFontSize: CGFloat, inputPlaceholder: String, inputFieldHeight: CGFloat, superview: UIView, childViewDistanceBetween: CGFloat, containerWidth: (landScape: CGFloat, protrait: CGFloat)) -> (Label: UILabel, InputField: UITextField, Container: UIView, adaptFn: (CGSize) -> Void) {
        // params textLabelParams, inputFieldParams
        // returns Label, InputField, Container, adaptFn (size) -> Void
        
        // common
        var nsLabelLeft = NSLayoutConstraint()
        
        // protrait
        var nsLabelTop = NSLayoutConstraint()
        var nsInputLeft = NSLayoutConstraint()
        var nsInputRight = NSLayoutConstraint()
        var nsInputTop = NSLayoutConstraint()
        var nsInputHeight = NSLayoutConstraint()
        let nsProtraitConstraintCollection : [NSLayoutConstraint] = [
            nsLabelLeft,
            nsLabelTop,
            nsInputLeft,
            nsInputRight,
            nsInputTop,
            nsInputHeight
        ]
        
        // landscape
        var nsLabelRight = NSLayoutConstraint()
        var nsLabelCenterY = NSLayoutConstraint()
        var nsLInputRight = NSLayoutConstraint()
        var nsInputCenterY = NSLayoutConstraint()
        var nsLInputHeight = NSLayoutConstraint()
        let nsLandscapeConstraintCollection: [NSLayoutConstraint] = [
            nsLabelLeft,
            nsLabelRight,
            nsLabelCenterY,
            nsLInputRight,
            nsInputCenterY,
            nsLInputHeight
        ]
        
        // Contianer View
        let containerView: UIView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        var containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: 0)
        containerViewHeightConstraint.isActive = true
        var containerViewWidthConstraint = containerView.widthAnchor.constraint(equalToConstant: 0)
        containerViewWidthConstraint.isActive = true
        containerView.backgroundColor = .yellow
        superview.addSubview(containerView)
        
        // Label
        let label = UILabel()
        label.text = labelText
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // InputField
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = labelText
        
        containerView.addSubview(label)
        containerView.addSubview(tf)
        
        func setupAdaptiveLayoutConstraints(size: CGSize) {
            if (size.width < size.height) {
                // protrait setup
                nsLandscapeConstraintCollection.forEach { $0.isActive = false }
                // setup container width & height for protrait
                containerViewWidthConstraint.constant = containerWidth.protrait
                containerViewHeightConstraint.constant = (labelFontSize + inputFieldHeight + childViewDistanceBetween) * 1.2
                // label and inputField constraints
                nsLabelLeft = label.leftAnchor.constraint(equalTo: containerView.leftAnchor)
                nsLabelTop = label.topAnchor.constraint(equalTo: containerView.topAnchor)
                nsInputLeft = tf.rightAnchor.constraint(equalTo: containerView.rightAnchor)
                nsInputRight = tf.rightAnchor.constraint(equalTo: containerView.rightAnchor)
                nsInputTop = tf.topAnchor.constraint(equalTo: label.bottomAnchor, constant: childViewDistanceBetween)
                nsInputHeight = tf.heightAnchor.constraint(equalToConstant: inputFieldHeight)
                nsProtraitConstraintCollection.forEach { $0.isActive = true }
                
            } else {
                // landscape setup
                nsProtraitConstraintCollection.forEach { $0.isActive = false }
                
                // container width & height setup
                containerViewWidthConstraint.constant = containerWidth.landScape
                containerViewHeightConstraint.constant = (inputFieldHeight + childViewDistanceBetween) * 1.2
            }
        }
        
        return (label, tf, containerView, setupAdaptiveLayoutConstraints)
        
    }
    
    func setupLoginBtn() {
        //        view.addSubview(loginBtn)
        //        NSLayoutConstraint.activate([
        //            loginBtn.topAnchor.constraint(equalTo: guide.yMiddleXLine.bottomAnchor),
        //            loginBtn.leftAnchor.constraint(equalTo: passwordTextField.leftAnchor)
        //        ])
    }
    
    func setupRegistraitonBtn() {
        //        view.addSubview(createAccountText)
        //        NSLayoutConstraint.activate([
        //            createAccountText.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: K.AppSizes.md),
        //            createAccountText.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor)
        //        ])
        //
        //        view.addSubview(registrationBtn)
        //        NSLayoutConstraint.activate([
        //            registrationBtn.topAnchor.constraint(equalTo: createAccountText.bottomAnchor, constant: K.AppSizes.xs),
        //            registrationBtn.rightAnchor.constraint(equalTo: createAccountText.rightAnchor)
        //        ])
    }
}
