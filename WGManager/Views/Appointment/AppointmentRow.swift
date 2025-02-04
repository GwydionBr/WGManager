//
//  AppointmentRow.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 03.02.25.
//

import SwiftUI

struct AppointmentRow: View {
    @Bindable var appointment: Appointment
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(appointment.name)
                .font(.headline)
            Text("\(appointment.startDate, style: .date) at \(appointment.startDate, style: .time)")
                .font(.subheadline)
            Text("Duration: \(appointment.duration) minutes")
                .font(.subheadline)
            Text("Location: \(appointment.location)")
                .font(.subheadline)
        }
    }
}

//#Preview {
//    AppointmentRow()
//}
