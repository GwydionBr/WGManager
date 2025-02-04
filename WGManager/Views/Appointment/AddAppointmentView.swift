//
//  AddAppointmentView.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 03.02.25.
//

import SwiftUI
import SwiftData

struct AddAppointmentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Binding var showAddAppointment: Bool
    
    @State private var title = ""
    @State private var location = ""
    @State private var date = Date()
    @State private var duration = 15
    
    // Definierte Schritte für die Dauer
    private let durationSteps = [15, 30, 45, 60, 90, 120]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Location", text: $location)
                    DatePicker("Date", selection: $date)
                    
                    Stepper("Duration: \(formattedDuration)", onIncrement: {
                        if let nextValue = nextStep(current: duration) {
                            duration = nextValue
                        }
                    }, onDecrement: {
                        if let prevValue = previousStep(current: duration) {
                            duration = prevValue
                        }
                    })
                }
                
                Section {
                    Button(action: {
                        saveAppointment()
                    }) {
                        Text("Save")
                    }
                }
            }
            .navigationTitle("Add Appointment")
        }
    }
    
    private var formattedDuration: String {
        if duration < 60 {
            return "\(duration) minutes"
        } else {
            return "\(duration / 60) hour\(duration >= 120 ? "s" : "")"
        }
    }
    
    private func nextStep(current: Int) -> Int? {
        guard let currentIndex = durationSteps.firstIndex(of: current), currentIndex < durationSteps.count - 1 else { return nil }
        return durationSteps[currentIndex + 1]
    }
    
    private func previousStep(current: Int) -> Int? {
        guard let currentIndex = durationSteps.firstIndex(of: current), currentIndex > 0 else { return nil }
        return durationSteps[currentIndex - 1]
    }
    
    private func saveAppointment() {
        let appointment = Appointment(name: title, startDate: date, duration: duration, location: location, notes: "")
        modelContext.insert(appointment)
        title = ""
        location = ""
        date = Date()
        print("Appointment saved")
        showAddAppointment = false
    }
}



#Preview {
    AddAppointmentView(showAddAppointment: .constant(true))
}
