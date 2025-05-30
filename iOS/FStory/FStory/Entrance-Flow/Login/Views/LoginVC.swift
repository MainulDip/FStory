//
//  View.swift
//  FStory
//
//  Created by Mainul Dip on 5/19/25.
//

import Foundation
import UIKit

protocol AnyLoginVC: AnyObject {
    var presenter: AnyLoginPresenter? {get set}
}

class LoginVC: UIViewController, AnyLoginVC {
    var presenter: AnyLoginPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        
        print("This is login VC")
    }
}
