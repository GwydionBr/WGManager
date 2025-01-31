//
//  GroceryListView.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 30.01.25.
//

import SwiftUI
import SwiftData

struct GroceryList: View {
    @Query(filter: #Predicate<GroceryItem> { $0.isActivated },
           sort: \GroceryItem.timestamp,
           order: .reverse) private var groceries: [GroceryItem]
    @Query(filter: #Predicate<GroceryItem> { !$0.isActivated },
           sort: \GroceryItem.timestamp,
           order: .reverse) private var deactiveGroceries: [GroceryItem]
    
    var body: some View {
        List {
            Section(header: Text("Groceries")) {
                ForEach(groceries) { grocery in
                    GroceryRow(grocery: grocery)
                }
            }
            Section(header: Text("Deactivated")) {
                ForEach(deactiveGroceries) { grocery in
                    DeactiveGroceryRow(grocery: grocery)
                }
            }
        }
    }
}

//#Preview {
//    GroceryListView()
//}
