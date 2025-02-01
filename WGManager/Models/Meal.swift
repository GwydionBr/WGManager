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
    var ingredients: [Ingredient] = []
    var isFavorite: Bool = false
    
    init(name: String, ingredients: [Ingredient]) {
        self.name = name
        self.ingredients = ingredients
    }
}
