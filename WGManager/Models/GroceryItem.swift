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
    var category: String = ""
    var unit: String = "Stück"
    var isChecked: Bool = false
    var isActivated: Bool
    var timestamp: Date = Date()
    
    init(name: String, isActivated: Bool = true) {
        self.name = name
        self.isActivated = isActivated
    }
}
