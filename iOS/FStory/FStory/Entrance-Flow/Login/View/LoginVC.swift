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

class LoginVC: UIViewController, AnyLoginVC {
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
//        formRow.labelView.target(forAction: #selector(labelClicked), withSender: nil)
        
        let text = UITextView()
        return (formRow.self, formRow.labelView, formRow.textFieldView)
    }()
    
    lazy var loginSubmitBtn: OnboardingButton = {
        let btn = appCommonBtn(title: K.AppTexts.loginBtnText, titleColor: K.AppColors.buttonTextPrimary, backgroundColor: K.AppColors.buttonBgPrimary)
        btn.addTarget(self, action: #selector(handleSubmitBtnTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var navigateToRegistrationText: UITextView = {
        let textView = UITextView()
        
//        textView.attributedText = NSAttributedString(
//            string: "Don't have an account, register here",
//            attributes: [
//                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13),
//                NSAttributedString.Key.foregroundColor: UIColor.blue,
//            ]
//        )
        
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
    @objc func handleSubmitBtnTapped() {
        print("Registration btn tapped")
        presenter?.didTapRegister()
    }
    
    @objc func handleRegistrationBtnTapped() {
        print("Registration btn tapped")
        presenter?.didTapRegister()
    }
    
    @objc func handleLoginBtnTapped() {
        
    }
    
    @objc func labelClicked() {
        print("label touched")
    }
}

// MARK: Layout Setup
extension LoginVC {
    func setupLayout() {
        setupPasswordRow()
        setupEmailRow()
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
}
