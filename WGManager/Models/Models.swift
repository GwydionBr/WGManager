//
//  Models.swift
//  WG-Manager
//
//  Created by Gwydion Braunsdorf on 25.01.25.
//

import Foundation

struct Profile: Codable {
    let id: UUID
    var username: String
    var fullName: String?
    var avatarURL: String?
    var email: String
    var birthday: Date?
    
    enum CodingKeys: String, CodingKey {
        case id, username, email, birthday
        case fullName = "full_name"
        case avatarURL = "avatar_url"
    }
}

struct ShoppingItem: Codable, Identifiable, Hashable {
    var id: UUID
    var name: String
    var quantity: Int
    var category: String
    var isComplete: Bool
    var userID: UUID
    
    enum CodingKeys: String, CodingKey {
        case id, name, quantity, category
        case isComplete = "is_complete"
        case userID = "user_id"
    }
}


struct Feature: Codable, Identifiable, Hashable {
    var id: Int?
    var createdAt: Date
    var text: String
    var isComplete: Bool
    var userID: UUID
    
    enum CodingKeys: String, CodingKey {
        case id, text
        case createdAt = "created_at"
        case isComplete = "is_complete"
        case userID = "user_id"
    }
}
