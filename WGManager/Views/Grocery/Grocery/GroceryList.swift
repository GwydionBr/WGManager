//
//  GroceryListView.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 30.01.25.
//

import SwiftUI
import SwiftData

struct GroceryList: View {
    @Environment(\.modelContext) private var modelContext
    @State private var editId: UUID? = nil

    @Query(sort: \GroceryItem.timestamp, order: .reverse) private var allGroceries: [GroceryItem] // ✅ Eine einzige Query

    var body: some View {
        List {
            let groceries = allGroceries.filter { !$0.isChecked } // ❌ Nicht abgehakt
            let checkedGroceries = allGroceries.filter { $0.isChecked } // ✅ Abgehakt
            let deactiveGroceries = allGroceries.filter { !$0.isActivated } // 🔄 Deaktivierte
            
            if !groceries.isEmpty {
                Section(header: Text("Groceries")) {
                    ForEach(groceries) { grocery in
                        GroceryRow(grocery: grocery, editId: $editId)
                    }
                    .onDelete(perform: { deleteGrocery(offsets: $0, from: groceries) })
                }
            }
            
            if !checkedGroceries.isEmpty {
                Section(header: Text("Checked")) {
                    ForEach(checkedGroceries) { grocery in
                        GroceryRow(grocery: grocery, editId: $editId)
                    }
                    .onDelete(perform: { deleteGrocery(offsets: $0, from: checkedGroceries) })
                }
            }
            
            if !deactiveGroceries.isEmpty {
                Section(header: Text("Deactivated")) {
                    ForEach(deactiveGroceries) { grocery in
                        DeactiveGroceryRow(grocery: grocery)
                    }
                    .onDelete(perform: { deleteGrocery(offsets: $0, from: deactiveGroceries) })
                }
            }
        }
    }
    
    /// Allgemeine Löschfunktion für alle Kategorien
    private func deleteGrocery(offsets: IndexSet, from list: [GroceryItem]) {
        for index in offsets {
            let groceryToDelete = list[index]
            modelContext.delete(groceryToDelete)
        }
    }
}

#Preview {
    do {
           let config = ModelConfiguration(isStoredInMemoryOnly: true)
           let container = try ModelContainer(for: GroceryItem.self, configurations: config)
           
           // Beispiel-Daten einfügen
           let context = container.mainContext
           for i in 1...5 {
               let grocery = GroceryItem(name: "Test \(i)")
               context.insert(grocery)
           }
           
           return GroceryList()
               .modelContainer(container)
       } catch {
           return Text("Fehler beim Laden der Vorschau: \(error.localizedDescription)")
       }
}
