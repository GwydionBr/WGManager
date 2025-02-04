//
//  AppointmentList.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 03.02.25.
//

import SwiftUI
import SwiftData

struct AppointmentList: View {
    @Query(sort: \Appointment.startDate, order: .reverse) private var appointments: [Appointment]
    
    @Binding var showAddAppointment: Bool
    
    var body: some View {
        List {
            ForEach(appointments) { appointment in
                AppointmentRow(appointment: appointment)
            }
        }
        .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showAddAppointment = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
    }
}

#Preview {
    AppointmentList(showAddAppointment: .constant(false))
}
