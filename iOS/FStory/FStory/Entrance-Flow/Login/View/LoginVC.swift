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
    //    var registrationBtn: OnboardingButton {get set}
}

class LoginVC: UIViewController, UITextViewDelegate, AnyLoginVC {
    var presenter: AnyLoginPresenter?
    
    // constants
    let formRowWidth: (protrait: CGFloat, landscape: CGFloat) = (protrait: 300, landscape: 470)
    let labelHeight: CGFloat = K.AppSizes.md - 6
    let inputFieldHeight: CGFloat = K.AppSizes.md
    let spaceBetween = K.AppSizes.xs
    let emailLabel: String = "Your Email"
    let emailPlaceholder: String = "example@gmail.com"
    let passwordLabel: String = "Your Password"
    let passwordPlaceholder: String = "Password"
    
    lazy var guide = centerXYLayoutGuide(containerView: self.view)
    
    lazy var emailRow: (container: OnBoardingFromRowView, label: UILabel, textField: UITextField) = {
        let formRow = OnBoardingFromRowView(
            superViewSize: view.bounds.size ,
            protraitWidth: formRowWidth.protrait,
            landscapeWidth: formRowWidth.landscape,
            labelHeight: labelHeight,
            labelText: emailLabel,
            spacing: spaceBetween,
            textFieldHeight: inputFieldHeight,
            placeHolderText: emailPlaceholder
        )
        formRow.setupLayout(superViewSize: self.view.bounds.size)
        return (formRow.self, formRow.labelView, formRow.textFieldView)
    }()
    
    lazy var passwordRow: (container: OnBoardingFromRowView, label: UILabel, textField: UITextField) = {
        let formRow = OnBoardingFromRowView(
            superViewSize: view.bounds.size ,
            protraitWidth: formRowWidth.protrait,
            landscapeWidth: formRowWidth.landscape,
            labelHeight: labelHeight,
            labelText: passwordLabel,
            spacing: spaceBetween,
            textFieldHeight: inputFieldHeight,
            placeHolderText: passwordPlaceholder
        )
        formRow.setupLayout(superViewSize: self.view.bounds.size)
        let text = UITextView()
        return (formRow.self, formRow.labelView, formRow.textFieldView)
    }()
    
    lazy var loginSubmitBtn: OnboardingButton = {
        let btn = appCommonBtn(title: K.AppTexts.loginBtnText, titleColor: K.AppColors.buttonTextPrimary, backgroundColor: K.AppColors.buttonBgPrimary)
        btn.addTarget(self, action: #selector(handleLoginBtnTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var navigateToRegistrationText: UITextView = {
        let textView = UITextView()
        let str = NSMutableAttributedString(
            string: K.AppTexts.regOnboardingText
        )
        str.addAttribute(
            NSAttributedString.Key.link,
            value: "navigateToRegistration",
            range: (str.string as NSString).range(of: K.AppTexts.regOnboardingClickableTExt)
        )
//        
        textView.attributedText = str
        textView.font = UIFont.systemFont(ofSize: 13)
        textView.delegate = self
        textView.isSelectable = true
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .clear
        
        return textView
    }()
    
    // registration should be a inline link not, containing some text
    //    lazy var registrationBtn: OnboardingButton = {
    //        let btn = appCommonBtn(title: K.AppTexts.regBtnText, titleColor: K.AppColors.buttonTextPrimary, backgroundColor: K.AppColors.buttonBgPrimary)
    //        btn.addTarget(self, action: #selector(handleRegistrationBtnTapped), for: .touchUpInside)
    //        btn.translatesAutoresizingMaskIntoConstraints = false
    //        return btn
    //    }()
    
    // error status
    // submit btn
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = K.AppColors.background
        
        print("This is login VC")
        guard let sPresenter = presenter else { return }
        sPresenter.viewDidLoad()
        setupLayout()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        emailRow.container.setupLayout(superViewSize: size)
        passwordRow.container.setupLayout(superViewSize: size)
    }
}


extension LoginVC {
    @objc func handleLoginBtnTapped() {
        presenter?.didTapLogin()
    }
    
    func handleRegistrationBtnTapped() {
        presenter?.didTapRegister()
    }
}

// MARK: Layout Setup
extension LoginVC {
    func setupLayout() {
        setupPasswordRow()
        setupEmailRow()
        setupLoginButton()
        setupNavigateToRegistrationTextLayout()
    }
    
    func setupPasswordRow() {
        view.addSubview(passwordRow.container)
        passwordRow.container.bottomAnchor.constraint(equalTo: guide.yMiddleXLine.topAnchor).isActive = true
        passwordRow.container.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupEmailRow() {
        view.addSubview(emailRow.container)
        emailRow.container.bottomAnchor.constraint(equalTo: passwordRow.container.topAnchor, constant: -spaceBetween * 2).isActive = true
        emailRow.container.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func setupLoginButton() {
        view.addSubview(loginSubmitBtn)
        loginSubmitBtn.topAnchor.constraint(equalTo: passwordRow.container.bottomAnchor, constant: spaceBetween * 3).isActive = true
        loginSubmitBtn.leftAnchor.constraint(equalTo: passwordRow.container.leftAnchor).isActive = true
    }
    
    func setupNavigateToRegistrationTextLayout() {
        view.addSubview(navigateToRegistrationText)
        navigateToRegistrationText.topAnchor.constraint(equalTo: loginSubmitBtn.bottomAnchor, constant: 20).isActive = true
//        navigateToRegistrationText.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        navigateToRegistrationText.leftAnchor.constraint(equalTo: passwordRow.container.leftAnchor).isActive = true
        navigateToRegistrationText.rightAnchor.constraint(equalTo: passwordRow.container.rightAnchor).isActive = true
    }
}

// MARK: User Interaction Handler
extension LoginVC {
    func textView(_ textView: UITextView, primaryActionFor textItem: UITextItem, defaultAction: UIAction) -> UIAction? {
        let navigateAction = UIAction(title: "navigateToRegistrationScreen") { [weak self] (action) in
            self?.handleRegistrationBtnTapped()
        }
        return navigateAction
    }
}
