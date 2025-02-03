//
//  GroceryView.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 31.01.25.
//

import SwiftUI


struct GroceryView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                AddGroceryView()
                GroceryList()
            }
            .navigationTitle("Einkaufsliste") // ✅ Titel der Navbar
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: MealView()) {
                        Image(systemName: "fork.knife") // 🍽 SFSymbol für Mahlzeiten
                            .font(.title2)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: GroceryCategoryView()) {
                        Image(systemName: "list.bullet") // 📋 SFSymbol für Kategorien
                            .font(.title2)
                    }
                }
            }
        }
    }
}

#Preview {
    GroceryView()
}
