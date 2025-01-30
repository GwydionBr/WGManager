//
//  GroceryView.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 31.01.25.
//

import SwiftUI

struct GroceryView: View {
    var body: some View {
        VStack(spacing: 0) {
            AddGroceryView()
            GroceryList()
        }
    }
}

#Preview {
    GroceryView()
}
