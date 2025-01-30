//
//  GroceryListView.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 30.01.25.
//

import SwiftUI
import SwiftData

struct GroceryList: View {
    @Query(sort: \Grocery.timestamp, order: .reverse) private var groceries: [Grocery]
    
    var body: some View {
        List {
            ForEach(groceries) { grocery in
                GroceryRow(grocery: grocery)
            }
        }
    }
}

//#Preview {
//    GroceryListView()
//}
