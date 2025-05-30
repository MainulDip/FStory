//
//  AutoLayoutHelpers.swift
//  FStory
//
//  Created by Mainul Dip on 5/25/25.
//

import Foundation
import UIKit

func contrainXCenterUnderParent(child: UIView, topView: UIView, container: UIView) {
    NSLayoutConstraint.activate([
        child.centerXAnchor.constraint(equalTo: container.layoutMarginsGuide.centerXAnchor),
        child.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 8)
    ])
}
