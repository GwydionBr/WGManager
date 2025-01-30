//
//  KalenderView.swift
//  Dicee-SwiftUI
//
//  Created by Gwydion Braunsdorf on 03.01.25.
//

import SwiftUI
import FSCalendar

struct Calendar: UIViewRepresentable {
    @Binding var selectedDate: Date

    // Erstellt und konfiguriert die FSCalendar-Instanz
    func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        
        // Optional: Kalender-Anpassungen
        calendar.scrollDirection = .horizontal
        calendar.scope = .month
        calendar.appearance.headerTitleColor = .systemBlue
        calendar.appearance.weekdayTextColor = .gray
        calendar.appearance.selectionColor = .systemBlue
        
        return calendar
    }

    // Aktualisiert den Kalender, wenn sich die Daten ändern
    func updateUIView(_ uiView: FSCalendar, context: Context) {
        // Kann verwendet werden, um den Kalender basierend auf externen Änderungen zu aktualisieren
    }

    // Erstellt einen Coordinator, der als Brücke zwischen SwiftUI und UIKit dient
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // Coordinator-Klasse zur Verwaltung von Delegaten und Daten
    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
        var parent: Calendar

        init(_ parent: Calendar) {
            self.parent = parent
        }

        // FSCalendarDelegate - Wird aufgerufen, wenn ein Datum ausgewählt wird
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            parent.selectedDate = date
        }
    }
}

#Preview {
    Calendar(selectedDate: .constant(Date()))
}
