//
//  StoryDesign.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import SwiftUI

struct StoryDesign: View {
    @ObservedObject var viewModel:HomeViewModel
    var body: some View {
        VStack(alignment:.leading,spacing:1){
            Text("Stories")
                .font(.title2)
                .fontWeight(.semibold)
            ScrollView(.horizontal,showsIndicators: false) {
              
                HStack(spacing:20){
                    VStack{
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundStyle(.blue)
                    }
                    .frame(width: 120,height: 150)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(25)
                    ForEach(viewModel.stories,id:\.id){ story in
                        ZStack {
                            Image("test")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 150)
                                .clipped()
                                .cornerRadius(25)
                            VStack{
                                Text("\(story.user.name) \(story.user.surname)")
                                    
                                  Spacer()
                                HStack{
                                    Image(systemName: "mappin.and.ellipse")
                                    Text(story.locationInfo)
                                }
                            }.foregroundStyle(.white)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .padding()
                           
                               
                            
                        }
                        .frame(width: 130, height: 160)
                        .cornerRadius(25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.blue, lineWidth: 2)
                        )
                       
                    }
                    
                }.padding(.vertical)
            }
        }.padding(.horizontal)
    }
}

#Preview {
    StoryDesign(viewModel: HomeViewModel(service: HomeService()))
}
