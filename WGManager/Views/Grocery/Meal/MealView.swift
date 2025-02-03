//
//  MealView.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 31.01.25.
//

import SwiftUI

struct MealView: View {
    var body: some View {
        NavigationStack {
            VStack {
                MealList()
            }
            .navigationTitle("Mahlzeiten") // ✅ Titel der Navbar
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddMealView()) {
                        Image(systemName: "plus.circle.fill") // ✅ Plus-Symbol
                            .font(.title2)
                            .foregroundColor(.blue) // Optional für bessere Sichtbarkeit
                    }
                }
            }
        }
    }
}

#Preview {
    MealView()
}
