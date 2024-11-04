//
//  ReviewCell.swift
//  Voyagely
//
//  Created by Engin Gülek on 4.11.2024.
//

import SwiftUI

struct ReviewCell: View {
    var body: some View {
        VStack {
            HStack{
                Image("test")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50,height: 50)
                    .clipShape(Circle())
                VStack(alignment:.leading){
                    PrimaryTitle(text: "Name Surname")
                    ImageAndText(image: "star.fill", title: "4.0")
                }
                Spacer()
                Text("11.12.2024")
            }
            
            Text("orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley ")
        }
        .padding()
        .border(.black, width: 1)
        .cornerRadius(5)
        .padding()
    }
}

#Preview {
    ReviewCell()
}
