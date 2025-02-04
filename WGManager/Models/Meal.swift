//
//  Meal.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 31.01.25.
//

import Foundation
import SwiftData

@Model
class Meal {
    var name: String = ""
    var isFavorite: Bool = false
    
    @Relationship(deleteRule: .cascade)
    var ingredients: [Ingredient]? = [Ingredient]()
    
    
    init(name: String, ingredients: [Ingredient]) {
        self.name = name
        self.ingredients = ingredients
        for ingredient in ingredients {
                    ingredient.meal = self  // Ensure the inverse relationship is set
                }
    }
}
