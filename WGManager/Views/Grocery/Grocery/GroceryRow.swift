//
//  GroceryRow.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 30.01.25.
//

import SwiftUI
import SwiftData

struct GroceryRow: View {
    @Bindable var grocery: GroceryItem
    @Binding var editId: UUID?

    let availableUnits = ["kg", "g", "l", "ml", "Stück"] // ✅ Mögliche Einheiten
    let wholeAmounts = Array(1...100) // ✅ Werte für den Mengen-Picker

    var body: some View {
        HStack {
            // ✅ Checkbox für `isChecked`
            Image(systemName: grocery.isChecked ? "checkmark.circle.fill" : "circle")
                .foregroundColor(grocery.isChecked ? .green : .gray)
                .font(.title)
                .onTapGesture {
                    withAnimation {
                        grocery.isChecked.toggle()
                        grocery.timestamp = .now
                    }
                }

            Text(grocery.name)
            
            Spacer()

            if editId == grocery.id {
                HStack {
                    // 🔄 `Picker` für Menge
                    Picker("", selection: $grocery.amount) {
                        ForEach(wholeAmounts, id: \.self) { amount in
                            Text("\(amount)").tag(amount)
                        }
                    }
                    .frame(width: 50, height: 80)
                    .clipped()
                    .pickerStyle(WheelPickerStyle())  // ✅ Dropdown-Menü

                    // 🔄 `Picker` für Einheit
                    Picker("", selection: $grocery.unit) {
                        ForEach(availableUnits, id: \.self) { unit in
                            Text(unit).tag(unit)
                        }
                    }
                    .frame(width: 80)
                    .clipped()
                    .pickerStyle(MenuPickerStyle())  // ✅ Dropdown-Menü
                }
                .padding(5)
                .background(Color.blue.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .transition(.opacity) // Sanfte Animation beim Wechsel
            } else {
                // 📌 Normale Anzeige, wenn nicht im Bearbeitungsmodus
                HStack {
                    Text("\(grocery.amount)")
                        .padding(.leading, 8)
                    Text(grocery.unit)
                        .padding(5)
                }
                .background(Color.blue.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .font(.headline)
                .onTapGesture {
                    withAnimation {
                        editId = grocery.id
                    }
                }
            }
        }
        .padding(.vertical, 2)
        .onTapGesture {
            withAnimation {
                editId = nil
            }
        }
    }
}
//
//#Preview {
//    GroceryRow(grocery: GroceryItem(name: "Milch"))
//}
