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
    @Query(sort: \GroceryCategory.name) private var allCategories: [GroceryCategory]
    @State private var groceryName: String = ""
    @State private var groceryCategory: GroceryCategory?
    @State private var groceryAmount: Int = 1
    
    var body: some View {
        Form {
            Section(header: Text("Neues Lebensmittel hinzufügen")) {
                VStack{
                    HStack{
                        TextField("Name", text: $groceryName, onCommit: saveGrocery)
                        
                        Button(action: saveGrocery) {
                            Label("Hinzufügen", systemImage: "plus.circle.fill")
                                .foregroundColor(.blue)
                        }
                        
                    }
                    
//                        Picker("Kategorie", selection: $groceryCategory) {
//                            Text("Sonstiges").tag(nil as GroceryCategory?)
//                            ForEach(allCategories, id: \.self) { category in
//                                Text(category.name).tag(category as GroceryCategory?)
//                            }
//                        }
//                        Divider()
//                        Picker("Menge", selection: $groceryAmount) {
//                            ForEach(1...100, id: \.self) { amount in
//                                Text("\(amount)").tag(amount)
//                            }
//                        }
                }
            }
        }
        .frame(height: 100)
    }
    
    /// Speichert ein neues Grocery-Objekt
    private func saveGrocery() {
        guard !groceryName.isEmpty else { return }
        
        let newGrocery = GroceryItem(
            name: groceryName,
            isActivated: true,
            amount: groceryAmount,
            category: groceryCategory
        )
        
        modelContext.insert(newGrocery)
        groceryName = ""
        groceryAmount = 1
        groceryCategory = nil
    }
}

#Preview {
    AddGroceryView()
}
