//
//  CategoryRow.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 02.02.25.
//

import SwiftUI
import SwiftData

struct CategoryRow: View {
    @Environment(\.modelContext) private var modelContext
    @Bindable var category: GroceryCategory
    
    var body: some View {
        Text(category.name)
        
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: GroceryCategory.self, configurations: config)
    
    let category = GroceryCategory(name: "Test")
    let category2 = GroceryCategory(name: "Test2")
    
    Spacer()
    CategoryRow(category: category)
        .modelContainer(container)
    Spacer()
    CategoryRow(category: category2)
        .modelContainer(container)
    Spacer()
}
