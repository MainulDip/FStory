//
//  CustomButton.swift
//  FStory
//
//  Created by Mainul Dip on 6/2/25.
//

import UIKit

class OnboardingButton: UIButton {
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
    
    override var intrinsicContentSize: CGSize {
        let originalIntrinsicContentSize = super.intrinsicContentSize
        return CGSize(width: originalIntrinsicContentSize.width + K.AppSizes.lg, height: originalIntrinsicContentSize.height + K.AppSizes.xs)
    }
}
