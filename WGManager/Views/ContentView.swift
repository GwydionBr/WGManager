//
//  ContentView.swift
//  WG-Manager
//
//  Created by Gwydion Braunsdorf on 26.01.25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            GroceryView()
                .tabItem {
                    Label("Einkaufsliste", systemImage: "cart.fill")
                }
            
            AppointmentView()
                .tabItem {
                    Label("Termine", systemImage: "clock.fill")
                }
            
            CalendarView()
                .tabItem {
                    Label("Kalender", systemImage: "calendar")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.fill")
                }
        }
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profil")
    }
}

#Preview {
    ContentView()
}
