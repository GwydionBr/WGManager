//
//  User.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 30.01.25.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var city: String
    var joinDate: Date
    
    init(name: String , city: String , joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
