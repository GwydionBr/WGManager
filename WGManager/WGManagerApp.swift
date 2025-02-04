//
//  WGManagerApp.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 30.01.25.
//

import SwiftUI
import SwiftData

@main
struct WGManagerApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [GroceryItem.self, Meal.self, GroceryCategory.self, Appointment.self])
    }
}
