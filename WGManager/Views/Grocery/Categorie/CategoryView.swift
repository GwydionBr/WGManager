//
//  GroceryCategoryView.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 02.02.25.
//

import SwiftUI
import SwiftData

struct CategoryView: View {
    @Environment(\.modelContext) private var modelContext

    @State private var newCategoryName: String = ""

    var body: some View {
        VStack {
            // Eingabefeld für neue Kategorie
            HStack {
                TextField("Neue Kategorie eingeben", text: $newCategoryName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: addCategory) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                }
                .padding(.trailing)
                .disabled(newCategoryName.isEmpty) // Button deaktivieren, wenn Feld leer
            }

//             Anzeige der Kategorien (GroceryCategoryList)
            CategoryList()
            
        }
        .navigationTitle("Kategorien")
    }
    
    private func addCategory() {
        let newCategory = GroceryCategory(name: newCategoryName)
        modelContext.insert(newCategory) // In SwiftData speichern
        newCategoryName = "" // Eingabefeld leeren
    }
}

//#Preview {
//    GroceryCategoryView()
//}
