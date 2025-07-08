//
//  OnBoardingFromRowBuilder.swift
//  FStory
//
//  Created by Mainul Dip on 6/14/25.
//

import Foundation
import UIKit

class OnBoardingFromRowView: UIView {
    
    // constants
    let textFieldViewVerticalPadding = 2 * K.AppSizes.sm
    let textFieldViewCornerRadius: CGFloat = K.AppSizes.xs
    
    // initializer props
    var protraitWidth: CGFloat
    var landscapeWidth: CGFloat
    var labelHeight: CGFloat
    var labelText: String
    var textFieldHeight: CGFloat
    var placeHolderText: String
    var inBetweenSpacing: CGFloat
    
    // container width and height anchor
    var widthConstraint = NSLayoutConstraint()
    var heightConstraint = NSLayoutConstraint()
    
    // label Contraints
    var labelLeftConstraint = NSLayoutConstraint() // P/L same
    var labelTopConstraint = NSLayoutConstraint() // P/L same
    var labelRightConstraint = NSLayoutConstraint() // P/L different
    var labelCenterYConstraint = NSLayoutConstraint() // should be disabled in protrait
    
    // textField Constraints
    var tFLeftConstraint = NSLayoutConstraint() // P/L different, P/self.left, L/labelRight
    var tFTopConstraint = NSLayoutConstraint() // P/L different, P/labelBottom, L/labelTop
    var tFRightConstraint = NSLayoutConstraint() // P/L same
    var tFHeightConstraint = NSLayoutConstraint() // P/L same
    var tFCenterYConstraint = NSLayoutConstraint() // only for L, on P this should be disabled
    
    var constraintCollections: [NSLayoutConstraint] = []
    
    
    // labelHeight, textFieldHeight
    init(superViewSize: CGSize, protraitWidth: CGFloat, landscapeWidth: CGFloat, labelHeight: CGFloat, labelText: String, spacing: CGFloat, textFieldHeight: CGFloat, placeHolderText: String) {
        self.protraitWidth = protraitWidth
        self.landscapeWidth = landscapeWidth
        self.labelHeight = labelHeight
        self.labelText = labelText
        self.textFieldHeight = textFieldHeight
        self.inBetweenSpacing = spacing
        self.placeHolderText = placeHolderText
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        widthConstraint = self.widthAnchor.constraint(equalToConstant: protraitWidth)
        heightConstraint = self.heightAnchor.constraint(equalToConstant: labelHeight + spacing + textFieldHeight + textFieldViewVerticalPadding)
        widthConstraint.isActive = true
        heightConstraint.isActive = true
//        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var labelView: UILabel = {
        let label = UILabel()
        label.text = labelText
        label.font = .systemFont(ofSize: labelHeight)
//        label.backgroundColor = .green
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    lazy var textFieldView: UITextField = {
        let textField = UITextField()
//        textField.backgroundColor = .yellow
        textField.placeholder = self.placeHolderText
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = textFieldViewCornerRadius
        textField.layer.borderWidth = 1
        textField.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.4)
        textField.layer.masksToBounds = true
        textField.font = .systemFont(ofSize: textFieldHeight)
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: K.AppSizes.xs, height: 10))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    func getDeviceOrientation (size: CGSize) -> DeviceOrientation {
        return size.height > size.width ? .portrait : .landscape
    }
}

extension OnBoardingFromRowView {
    func setupLayout(superViewSize: CGSize) {
//        backgroundColor = .orange
        let orientation = getDeviceOrientation(size: superViewSize)
        
        switch orientation {
        case .portrait:
            widthConstraint.constant = protraitWidth
            heightConstraint.constant = labelHeight + inBetweenSpacing + textFieldHeight + textFieldViewVerticalPadding
        case .landscape:
            widthConstraint.constant = landscapeWidth
            heightConstraint.constant = textFieldHeight + textFieldViewVerticalPadding
        }
        adaptiveConstraintsSetup(superViewSize: superViewSize)
    }
    
    func adaptiveConstraintsSetup(superViewSize: CGSize) {
        let orientation = getDeviceOrientation(size: superViewSize)
        if !constraintCollections.isEmpty {
            print("constraintCollections not empty")
            labelView.removeConstraints(constraintCollections)
            textFieldView.removeConstraints(constraintCollections)
            labelView.removeFromSuperview()
            textFieldView.removeFromSuperview()
        }
        addSubview(labelView)
        addSubview(textFieldView)
                
        switch orientation {
        case .portrait:
            print("protrait")
            labelLeftConstraint = labelView.leftAnchor.constraint(equalTo: leftAnchor)
            labelTopConstraint = labelView.topAnchor.constraint(equalTo: topAnchor)
            labelRightConstraint = labelView.rightAnchor.constraint(equalTo: rightAnchor)
//            labelCenterYConstraint = labelView.centerYAnchor.constraint(equalTo: centerYAnchor)
            
            tFLeftConstraint = textFieldView.leftAnchor.constraint(equalTo: leftAnchor)
            tFTopConstraint = textFieldView.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: inBetweenSpacing)
            tFRightConstraint = textFieldView.rightAnchor.constraint(equalTo: rightAnchor)
            tFHeightConstraint = textFieldView.heightAnchor.constraint(equalToConstant: textFieldHeight + textFieldViewVerticalPadding)
            
            [labelLeftConstraint, labelTopConstraint, labelRightConstraint, tFLeftConstraint, tFTopConstraint, tFRightConstraint, tFHeightConstraint].forEach({$0.isActive = true})
        case .landscape:
            print("landscape")
            labelLeftConstraint = labelView.leftAnchor.constraint(equalTo: leftAnchor)
            labelTopConstraint = labelView.topAnchor.constraint(equalTo: topAnchor)
            labelRightConstraint = labelView.rightAnchor.constraint(equalTo: textFieldView.leftAnchor, constant: -inBetweenSpacing * 2)
            labelCenterYConstraint = labelView.centerYAnchor.constraint(equalTo: centerYAnchor)
            
            tFLeftConstraint = textFieldView.leftAnchor.constraint(equalTo: labelView.rightAnchor, constant: inBetweenSpacing * 2)
            tFTopConstraint = textFieldView.topAnchor.constraint(equalTo: labelView.topAnchor)
            tFRightConstraint = textFieldView.rightAnchor.constraint(equalTo: rightAnchor)
//            tFHeightConstraint = textFieldView.heightAnchor.constraint(equalToConstant: 30)
            tFCenterYConstraint = textFieldView.centerYAnchor.constraint(equalTo: centerYAnchor)
            
            [labelLeftConstraint, labelTopConstraint, labelRightConstraint, labelCenterYConstraint, tFLeftConstraint, tFTopConstraint, tFRightConstraint, tFCenterYConstraint].forEach({$0.isActive = true})
        }
        
        constraintCollections = [labelLeftConstraint, labelTopConstraint, labelRightConstraint, labelCenterYConstraint, tFLeftConstraint, tFTopConstraint, tFRightConstraint, tFHeightConstraint, tFCenterYConstraint]
    }
}

enum DeviceOrientation {
    case portrait
    case landscape
}
