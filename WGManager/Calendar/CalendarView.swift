//
//  ContentView.swift
//  WG-Manager
//
//  Created by Gwydion Braunsdorf on 05.01.25.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedDate: Date = Date()

    var body: some View {
        VStack {
            Text("Ausgewähltes Datum:")
            Text("\(selectedDate, formatter: dateFormatter)")
                .font(.headline)
                .padding()

            Calendar(selectedDate: $selectedDate)
                .frame(height: 400) // Höhe anpassen
                .padding()

            Spacer()
        }
    }

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}


#Preview {
    CalendarView()
}
