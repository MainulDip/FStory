//
//  CommonButtonHelpers.swift
//  FStory
//
//  Created by Mainul Dip on 5/25/25.
//

import Foundation
import UIKit

func appCommonBtn(title: String, titleColor: UIColor, backgroundColor: UIColor, fontSize: CGFloat = K.AppSizes.md, weight: UIFont.Weight = .medium, cornerRadius: CGFloat = K.AppSizes.xs,  state: UIControl.State = .normal) -> OnboardingButton {
    let button = OnboardingButton(type: .system)
    button.setTitle(title, for: state)
    button.setTitleColor(titleColor, for: state)
    button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
    button.layer.cornerRadius = cornerRadius
    button.backgroundColor = backgroundColor
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
}
