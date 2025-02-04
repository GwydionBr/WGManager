//
//  GroceryCategory.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 02.02.25.
//

import Foundation
import SwiftData
import UIKit

@Model
class GroceryCategory: Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var timestamp: Date = Date()

    @Relationship(deleteRule: .cascade)
    var subcategories: [GroceryCategory]? = [GroceryCategory]()
    
    @Relationship(inverse: \GroceryCategory.subcategories)
    var parent: GroceryCategory?
    
    @Relationship(inverse: \GroceryItem.category) // Beziehung zu GroceryItem
        var groceryItems: [GroceryItem]? = [GroceryItem]()

    init(name: String, parent: GroceryCategory? = nil) {
        self.name = name
        self.parent = parent
        self.timestamp = Date()
    }
}

extension GroceryCategory {
    static var category = GroceryCategory(name: "Test aus der Extension")
}
    
