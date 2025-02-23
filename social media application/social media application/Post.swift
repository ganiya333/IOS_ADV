//
//  Post.swift
//  social media application
//
//  Created by Ganiya Nursalieva on 23.02.2025.
//

import Foundation

struct Post {
    let id: UUID
    let authorId: UUID
    let userName: String
    var content: String
    var likes: Int
    var imageName: String? 
}
