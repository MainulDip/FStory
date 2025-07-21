//
//  GlobalConstants.swift
//  FStory
//
//  Created by Mainul Dip on 5/25/25.
//

import Foundation
import UIKit

class K {
    class AppTexts {
        static let welcomeTitle = "Welcome to FStory!"
        static let subWelcomeTitle = "It's a journey, not a destination"
        static let loginBtnText = "Login"
        static let regBtnText = "Register"
        static let regOnboardingClickableTExt = "here..."
        static let regOnboardingText = "Don't have an account? Create one from \(regOnboardingClickableTExt)"
        static let loginOnboardingText = "Have an account already?"
    }
    
    class AppColors {
        static let textPrimary = UIColor(named: "TextPrimary")!
        static let textSecondary = UIColor(named: "TextSecondary")!
        static let background = UIColor(named: "ScreenBackground")!
        static let buttonTextPrimary = UIColor(named: "ButtonTextPrimary")!
        static let buttonTextSecondary = UIColor(named: "ButtonTextSecondary")!
        static let buttonBgPrimary = UIColor(named: "ButtonBgPrimary")!
        static let buttonBgSecondary = UIColor(named: "ButtonBgSecondary")!
    }
    
    class AppSizes {
        static let xs: CGFloat = 8
        static let sm: CGFloat = 16
        static let md: CGFloat = 24
        static let lg: CGFloat = 32
        static let xl: CGFloat = 48
    }
}
