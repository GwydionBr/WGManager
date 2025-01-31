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
            
            ForEach(meal.ingredients) { ingredient in
                Button {
                    ingredient.isActivated = true
                } label: {
                    if ingredient.isActivated {
                        GroceryRow(grocery: ingredient)
                    } else {
                        DeactiveGroceryRow(grocery: ingredient)
                    }
                }
            }
        }
        .padding(.vertical, 6)
    }
}

//#Preview {
//    MealRowView()
//}
