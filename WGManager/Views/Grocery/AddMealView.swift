//
//  AddMealView.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 31.01.25.
//

import SwiftUI
import SwiftData

struct AddMealView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var mealName: String = ""
    @State private var selectedGrocery: GroceryItem?
    @State private var ingredients: [GroceryItem] = []
    @State private var newIngredientName: String = ""  // Neu eingegebene Zutat

    @Query private var groceries: [GroceryItem]  // Alle existierenden Zutaten

    @Environment(\.dismiss) var dismiss  // Ermöglicht das Schließen der Ansicht

    var body: some View {
        NavigationStack {
            Form {
                // 🥘 Name der Mahlzeit
                Section(header: Text("Mahlzeit Name")) {
                    TextField("Name der Mahlzeit", text: $mealName)
                }

                // 🥦 Zutaten auswählen
                Section(header: Text("Zutat aus vorhandenen Zutaten wählen")) {
                    Picker("Zutat auswählen", selection: $selectedGrocery) {
                        Text("Bitte wählen").tag(nil as GroceryItem?)
                        ForEach(groceries) { grocery in
                            Text(grocery.name).tag(grocery as GroceryItem?)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())

                    Button(action: addSelectedIngredient) {
                        Label("Hinzufügen", systemImage: "plus.circle.fill")
                            .foregroundColor(.blue)
                    }
                }

                // ✏️ Neue Zutat eingeben
                Section(header: Text("Neue Zutat hinzufügen")) {
                    HStack {
                        TextField("Neue Zutat", text: $newIngredientName)
                        Button(action: addNewIngredient) {
                            Label("Hinzufügen", systemImage: "plus")
                                .foregroundColor(.green)
                        }
                        .disabled(newIngredientName.isEmpty)
                    }
                }

                // 📋 Zutatenliste anzeigen
                Section(header: Text("Zutatenliste")) {
                    if ingredients.isEmpty {
                        Text("Noch keine Zutaten hinzugefügt")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(ingredients) { ingredient in
                            HStack {
                                Text(ingredient.name)
                                Spacer()
                                Button(action: { removeIngredient(ingredient) }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Neue Mahlzeit")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Abbrechen") {
                        dismiss()  // Schließt die Ansicht
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Speichern") {
                        saveMeal()
                    }
                    .disabled(mealName.isEmpty || ingredients.isEmpty)  // Verhindert leere Speicherung
                }
            }
        }
    }

    /// Fügt eine bestehende Zutat zur Liste hinzu
    private func addSelectedIngredient() {
        guard let grocery = selectedGrocery, !ingredients.contains(where: { $0.id == grocery.id }) else { return }
        ingredients.append(grocery)
        selectedGrocery = nil  // Picker zurücksetzen
    }

    /// Fügt eine neue Zutat zu SwiftData und zur Zutatenliste hinzu
    private func addNewIngredient() {
        let newGrocery = GroceryItem(
            name: newIngredientName,
            isActivated: false
        )

        modelContext.insert(newGrocery) // ✅ Neue Zutat in SwiftData speichern
        ingredients.append(newGrocery)  // ✅ Direkt zur Liste hinzufügen
        newIngredientName = ""  // Eingabefeld leeren
    }

    /// Entfernt eine Zutat aus der Liste
    private func removeIngredient(_ ingredient: GroceryItem) {
        ingredients.removeAll { $0.id == ingredient.id }
    }

    /// Speichert die Mahlzeit in SwiftData
    private func saveMeal() {
        let newMeal = Meal(name: mealName, ingredients: ingredients)
        modelContext.insert(newMeal)
        dismiss()  // Schließt die Ansicht nach dem Speichern
    }
}

#Preview {
    AddMealView()
}
