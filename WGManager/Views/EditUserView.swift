//
//  EditUserView.swift
//  WGManager
//
//  Created by Gwydion Braunsdorf on 30.01.25.
//

import SwiftUI
import SwiftData

struct EditUserView: View {
    @Bindable var user: User
    
    var body: some View {
        Form {
            Section(header: Text("User")) {
                TextField("Name", text: $user.name)
                TextField("City", text: $user.city)
                DatePicker("Join Date", selection: $user.joinDate, displayedComponents: .date)
            }
        }
        .navigationTitle("Edit User")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    EditUserView()
//        .modelContainer(for: User.self)
//}
