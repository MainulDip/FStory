//
//  Entity.swift
//  FStory
//
//  Created by Mainul Dip on 5/19/25.
//

import Foundation

struct User: Codable {
    let email: String
    let password: String
}


struct UserLoginCredentials: Codable {
    let email: String
    let password: String
}
