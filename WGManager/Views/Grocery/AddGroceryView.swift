//
//  AddGroceryView.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 30.01.25.
//

import SwiftUI
import SwiftData

struct AddGroceryView: View {
    @Environment(\.modelContext) var modelContext
    @State private var groceryName: String = ""
    
    var body: some View {
            Form {
                Section(header: Text("Neues Lebensmittel hinzufügen")) {
                    TextField("Name", text: $groceryName, onCommit: saveGrocery) // ⌨️ Speichern mit Enter
                    
                    Button(action: saveGrocery) {
                        Label("Hinzufügen", systemImage: "plus.circle.fill")
                            .foregroundColor(.blue)
                    }
                }
            }
            .frame(height: 150)
        }
    
    /// Speichert ein neues Grocery-Objekt
        private func saveGrocery() {
            guard !groceryName.isEmpty else { return } // Falls das Feld leer ist, nichts tun

            let newGrocery = Grocery(
                name: groceryName
            )
            
            modelContext.insert(newGrocery) // ✅ In SwiftData speichern
            groceryName = ""  // 🧹 Eingabefeld leeren
        }
}

//#Preview {
//    AddGroceryView(grocery: Grocery)
//}
