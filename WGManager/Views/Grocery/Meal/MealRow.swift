//
//  MealRowView.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 31.01.25.
//

import SwiftUI

struct MealRowView: View {
    var meal: Meal

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(meal.name)
                        .font(.headline)
                }
                Spacer()
                
                if meal.isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow) // Favoriten-Icon
                }
            }
            
            // ✅ Die `List` außerhalb der HStack platzieren
            
            if meal.ingredients == nil || meal.ingredients!.isEmpty {
                Text("No ingredients")
                    .foregroundColor(.secondary)
                    .font(.caption)
            } else {
                ForEach(meal.ingredients!, id: \.self) { ingredient in
                    IngredientRow(ingredient: ingredient)
                }
            }
            
        }
        .padding(.vertical, 6)
    }
}

//#Preview {
//    MealRowView()
//}
