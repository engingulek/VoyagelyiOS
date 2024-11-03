//
//  DetailInfoView.swift
//  Voyagely
//
//  Created by Engin Gülek on 3.11.2024.
//

import SwiftUI

struct DetailInfoView: View {
    var body: some View {
        VStack(spacing:15) {
            Text("Name")
                .foregroundStyle(.black)
                .fontWeight(.semibold)
                .font(.title2)
            HStack{
                ImageAndText(image: "mappin",
                             title: "Istabul,Bakırköy")
                Divider()
                    .frame(width: 5,height: 20)
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
                ImageAndText(image: "arrow.triangle.swap",
                             title: "14Km")
            }
            
            HStack{
                ImageAndText(image: "star.fill",
                             title: "4.5/5")
            }
            //TODO: Clickable
            Text("125 Review")
                .underline()
            
            VStack{
                Text("Adress")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                ImageAndText(image: "map",
                             title: "Bakır Street No:27 Bakırkoy,Istanbul")
                .underline()
                
            }
            
            VStack {
                Text("Description")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English")
            }.padding()
        }
    }
}

#Preview {
    DetailInfoView()
}