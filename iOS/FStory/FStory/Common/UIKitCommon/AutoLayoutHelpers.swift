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


func centerXYLayoutGuide(containerView: UIView) -> (xMiddleYLine: UILayoutGuide, yMiddleXLine: UILayoutGuide) {
    let xMiddleYLine = UILayoutGuide()
    containerView.addLayoutGuide(xMiddleYLine)
    xMiddleYLine.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor).isActive = true
    xMiddleYLine.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor).isActive = true
    xMiddleYLine.centerXAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
    let yMiddleXLine = UILayoutGuide()
    containerView.addLayoutGuide(yMiddleXLine)
    yMiddleXLine.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
    yMiddleXLine.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
//        layoutGuideYCenter.heightAnchor.constraint(equalToConstant: 0.1).isActive = true
    yMiddleXLine.centerYAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.centerYAnchor).isActive = true
    
    return (xMiddleYLine, yMiddleXLine)
}
