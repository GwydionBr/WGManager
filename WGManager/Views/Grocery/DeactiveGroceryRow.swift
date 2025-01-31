//
//  DeactiveGroceryRow.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 31.01.25.
//

import SwiftUI

struct DeactiveGroceryRow: View {
    @Bindable var grocery: GroceryItem
    
    var body: some View {
        HStack {
            // Checkbox-Symbol, das den Zustand von `isChecked` widerspiegelt
            Image(systemName: "circle.fill")
                .foregroundColor(.gray)
                .font(.title)
                .onTapGesture {
                    grocery.isActivated.toggle()
                }
            
            VStack(alignment: .leading) {
                Text(grocery.name)
                    .foregroundColor(.gray)
            }
            
            Spacer() // Füllt den Platz auf der rechten Seite
        }
        .padding(.vertical, 2)
    }
}

//#Preview {
//    DeactiveGroceryRow()
//}
