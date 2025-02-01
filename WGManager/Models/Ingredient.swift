//
//  Ingredient.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 31.01.25.
//

import Foundation
import SwiftData

@Model
class Ingredient {
    var id: UUID = UUID()
    var name: String
    var amount: Int
    var unit: String = "Stück"
    var timestamp: Date = Date()
    var category: String = ""
    
    init(name: String = "", amount: Int = 1) {
        self.name = name
        self.amount = amount
    }
}
