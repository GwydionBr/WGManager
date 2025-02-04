//
//  Appointment.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 03.02.25.
//

import Foundation
import SwiftData

@Model
class Appointment {
    var id: UUID = UUID()
    var name: String = ""
    var startDate: Date = Date()
    var duration: Int = 0
    var location: String = ""
    var notes: String = ""
    
    init(name: String, startDate: Date, duration: Int, location: String, notes: String) {
        self.name = name
        self.startDate = startDate
        self.duration = duration
        self.location = location
        self.notes = notes
    }
}
