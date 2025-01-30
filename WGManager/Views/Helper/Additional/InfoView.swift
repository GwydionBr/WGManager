//
//  InfoView.swift
//  AngelaCard
//
//  Created by Gwydion Braunsdorf on 03.01.25.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .frame(height: 50)
            .foregroundColor(.white)
            .overlay(
                HStack{
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                    Text(text)
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .bold()
                }
            )
    }
}


#Preview{
    ZStack{
        Color.black
        InfoView(text: "+49 123 456 789", imageName: "phone.fill")
    }
}
