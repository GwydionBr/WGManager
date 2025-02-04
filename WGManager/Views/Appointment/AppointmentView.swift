//
//  AppointmentView.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 03.02.25.
//

import SwiftUI

struct AppointmentView: View {
    @State private var showAddAppointment = false
    
    var body: some View {
        NavigationStack {
            AppointmentList(showAddAppointment: $showAddAppointment)
                .navigationTitle("Appointments")
                
        }
        .sheet(isPresented: $showAddAppointment) {
            AddAppointmentView(showAddAppointment: $showAddAppointment)
        }
    }
}

#Preview {
    AppointmentView()
}
