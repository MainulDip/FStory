//
//  Post.swift
//  FStory
//
//  Created by Mainul Dip on 6/1/25.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
