//
//  ListMealView.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 31.01.25.
//

import SwiftUI
import SwiftData

struct MealList: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Meal.name) private var meals: [Meal]  // Alle Mahlzeiten aus SwiftData
    
    var body: some View {
        List {
            if meals.isEmpty {
                Text("Keine Mahlzeiten vorhanden")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                    ForEach(meals) { meal in
                        MealRowView(meal: meal) // ✅ Meal in einer eigenen Zeilen-View darstellen
                    }
                    .onDelete(perform: deleteMeal) // ✅ Swipe-to-Delete hinzufügen
            }
        }
    }

    /// Löscht eine Mahlzeit aus SwiftData
    private func deleteMeal(at offsets: IndexSet) {
        for index in offsets {
            let mealToDelete = meals[index]
            modelContext.delete(mealToDelete)
        }
    }
}

#Preview {
    MealList()
}
