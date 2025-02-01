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
    @State private var selectedGrocery: Ingredient?
    @State private var selectedIngredients: [Ingredient] = []
    @State private var newIngredientName: String = ""  // Neu eingegebene Zutat

    @Query private var allIngredients: [Ingredient]  // Alle existierenden Zutaten

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
                        Text("Bitte wählen").tag(nil as Ingredient?)
                        ForEach(allIngredients) { grocery in
                            Text(grocery.name).tag(grocery as Ingredient?)
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
                    if selectedIngredients.isEmpty {
                        Text("Noch keine Zutaten hinzugefügt")
                            .foregroundColor(.gray)
                    } else {
                        ForEach(selectedIngredients) { ingredient in
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
                    .disabled(mealName.isEmpty || selectedIngredients.isEmpty)  // Verhindert leere Speicherung
                }
            }
        }
    }

    /// Fügt eine bestehende Zutat zur Liste hinzu
    private func addSelectedIngredient() {
        guard let grocery = selectedGrocery, !selectedIngredients.contains(where: { $0.id == grocery.id }) else { return }
        selectedIngredients.append(grocery)
        selectedGrocery = nil  // Picker zurücksetzen
    }

    /// Fügt eine neue Zutat zu SwiftData und zur Zutatenliste hinzu
    private func addNewIngredient() {
        let newIngredient = Ingredient(
            name: newIngredientName
        )

        modelContext.insert(newIngredient) // ✅ Neue Zutat in SwiftData speichern
        selectedIngredients.append(newIngredient)  // ✅ Direkt zur Liste hinzufügen
        newIngredientName = ""  // Eingabefeld leeren
    }

    /// Entfernt eine Zutat aus der Liste
    private func removeIngredient(_ ingredient: Ingredient) {
        selectedIngredients.removeAll { $0.id == ingredient.id }
    }

    /// Speichert die Mahlzeit in SwiftData
    private func saveMeal() {
        let newMeal = Meal(name: mealName, ingredients: selectedIngredients)
        modelContext.insert(newMeal)
        dismiss()  // Schließt die Ansicht nach dem Speichern
    }
}

#Preview {
    AddMealView()
}
