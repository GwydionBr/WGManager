//
//  Grocery.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 30.01.25.
//

import Foundation
import SwiftData

@Model
class GroceryItem {
    var id: UUID = UUID()
    var name: String
    var amount: Int = 1
    var unit: String = "Stück"
    var isChecked: Bool = false
    var isActivated: Bool
    var timestamp: Date = Date()
    
    @Relationship(deleteRule: .nullify)
        var category: GroceryCategory?
    
    init(name: String, isActivated: Bool = true, amount: Int = 1, unit: String = "Stück", category: GroceryCategory? = nil) {
        self.name = name
        self.isActivated = isActivated
    }
}
