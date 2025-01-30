//
//  Grocery.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 30.01.25.
//

import Foundation
import SwiftData

@Model
class Grocery {
    var name: String = ""
    var amount: Int = 1
    var category: String = ""
    var isChecked: Bool = false
    var timestamp: Date = Date()
    
    init(name: String) {
        self.name = name
    }
}
