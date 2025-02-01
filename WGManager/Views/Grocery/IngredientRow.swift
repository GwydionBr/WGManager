//
//  IngredientRow.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 31.01.25.
//

import SwiftUI

struct IngredientRow: View {
        @Bindable var ingredient: Ingredient
        
        var body: some View {
            HStack {
                Text(String(ingredient.amount))
                    .font(.headline)
                    .padding(.horizontal, 15)
                    .background(Color.orange.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Text(ingredient.name)
                    .padding(.leading, 8)
                
                Spacer() // Füllt den Platz auf der rechten Seite
                
            }
            .padding(.vertical, 2)
        }
    }

//#Preview {
//    IngredientRow()
//}
