////
////  ProfileView.swift
////  WG-Manager
////
////  Created by Gwydion Braunsdorf on 25.01.25.
////
//
//import SwiftUI
//import PhotosUI
//
//
//struct ProfileView: View {
//    @EnvironmentObject var authModel: AuthModel
//    @EnvironmentObject var db: DatabaseManager
//    
//    var body: some View {
//        VStack{
//            Text("Profile")
//                .font(.title)
//            Button {
//                Task {
//                    try await authModel.signOut()
//                    await authModel.isUserAuthenticated()
//                }
//            } label: {
//                Text("Sign Out")
//                    .fontWeight(.bold)
//                    .foregroundColor(.white)
//                    .padding()
//                    .background(Color.red)
//                    .cornerRadius(8)
//            }
//            .padding()
//            
//            // Profilbild
//            if let imageURL = URL(string: db.profile.avatarURL ?? "") {
//                AsyncImage(url: imageURL) { image in
//                    image
//                        .resizable()
//                        .scaledToFit()
//                } placeholder: {
//                    ProgressView()
//                }
//                .frame(width: 100, height: 100)
//            }
//            
//            Text("\(db.profile.username)")
//            Divider()
//            Text("\(db.profile.email)")
//            Divider()
//        }
//    }
//}
//
//#Preview {
//    ProfileView()
//}
