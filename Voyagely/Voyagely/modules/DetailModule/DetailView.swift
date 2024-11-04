//
//  DetailView.swift
//  Voyagely
//
//  Created by Engin Gülek on 1.11.2024.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel:DetailViewModel
    
    let images = ["test1","test1","test1","test1"]
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment:.top) {
                    ShowImages()
                    HStack{
                        BackButton()
                        Spacer()
                        FavButton()
                    }.padding()
                    
                }
                
                DetailInfoView(viewModel: viewModel)
                
                VStack{
                    Text(TextTheme.reviews.rawValue)
                        .font(.title3)
                        .fontWeight(.semibold)
                    ForEach(0..<5){_ in
                        VStack {
                            HStack{
                                Image("test")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50,height: 50)
                                    .clipShape(Circle())
                                VStack(alignment:.leading){
                                    Text("Name Surname")
                                        .fontWeight(.semibold)
                                        .font(.callout)
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
            }
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    DetailView(viewModel: DetailViewModel())
}

