//
//  GroceryRow.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 30.01.25.
//

import SwiftUI
import SwiftData

struct GroceryRow: View {
    @Bindable var grocery: Grocery
    
    var body: some View {
        HStack {
            // Checkbox-Symbol, das den Zustand von `isChecked` widerspiegelt
            Image(systemName: grocery.isChecked ? "checkmark.circle.fill" : "circle")
                .foregroundColor(grocery.isChecked ? .green : .gray)
                .font(.title)
                .onTapGesture {
                    grocery.isChecked.toggle()
                }
            
            VStack(alignment: .leading) {
                Text(grocery.name)
//                    .font(.title3)
                
//                Text("Menge: \(grocery.amount)")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
            }
            
            Spacer() // Füllt den Platz auf der rechten Seite
            
            Text(String(grocery.amount))
                .font(.headline)
                .padding(.horizontal, 8)
                .background(Color.orange.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding(.vertical, 2)
    }
}


#Preview {
    GroceryRow(grocery: Grocery(name: "Milch"))
}
