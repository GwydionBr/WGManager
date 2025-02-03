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
                CategoryRow(category: category, level: 0)
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
//#Preview {
//    GroceryCategoryList()
//}
