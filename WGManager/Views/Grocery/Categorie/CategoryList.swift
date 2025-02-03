//
//  GroceryCategoryList.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 02.02.25.
//

import SwiftUI
import SwiftData

struct CategoryList: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \GroceryCategory.timestamp, order: .reverse) private var categories: [GroceryCategory]

    var body: some View {
        List {
            ForEach(categories.filter { $0.parent == nil }) { category in
                CategoryRow(category: category)
            }
            .onDelete(perform: deleteCategory)
        }
        .navigationTitle("Kategorien")
    }

    private func deleteCategory(at offsets: IndexSet) {
        for index in offsets {
            let category = categories[index]
            modelContext.delete(category)
            try? modelContext.save() // Änderungen speichern
        }
    }
}

#Preview {
    do {
           let config = ModelConfiguration(isStoredInMemoryOnly: true)
           let container = try ModelContainer(for: GroceryCategory.self, configurations: config)
           
           // Beispiel-Daten einfügen
           let context = container.mainContext
           for i in 1...5 {
               let category = GroceryCategory(name: "Test \(i)")
               context.insert(category)
           }
           
           return CategoryList()
               .modelContainer(container)
       } catch {
           return Text("Fehler beim Laden der Vorschau: \(error.localizedDescription)")
       }
}
