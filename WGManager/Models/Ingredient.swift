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
    var name: String = ""
    var amount: Int = 1
    var unit: String = "Stück"
    var timestamp: Date = Date()
    var category: String = ""
    
    @Relationship(inverse: \Meal.ingredients)
        var meal: Meal?
    
    init(name: String = "", amount: Int = 1, meal: Meal? = nil) {
        self.name = name
        self.amount = amount
    }
}
