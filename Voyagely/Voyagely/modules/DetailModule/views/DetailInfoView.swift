//
//  DetailInfoView.swift
//  Voyagely
//
//  Created by Engin Gülek on 3.11.2024.
//

import SwiftUI

struct DetailInfoView: View {
    @ObservedObject var viewModel:DetailViewModel
    var body: some View {
        VStack(spacing:15) {
            HStack {
                Text(viewModel.detail?.name ?? "")
                    .foregroundStyle(.black)
                    .fontWeight(.semibold)
                    .font(.title2)
                HStack(spacing:1) {
                    ForEach(Array(repeating: "$", count: viewModel.detail?.priceScale ?? 0), 
                            id: \.self) { price in
                        Text(price)
                    }
                }
            }
          
            HStack{
                ImageAndText(image: "mappin",
                             title: "\(viewModel.detail?.district ?? ""),\(viewModel.detail?.city ?? "")")
                Divider()
                    .frame(width: 5,height: 20)
                    .foregroundStyle(.gray)
                    .fontWeight(.semibold)
                ImageAndText(image: "arrow.triangle.swap",
                             
                             title: viewModel.calculateDistance(longitude: viewModel.detail?.longitude ?? 0.0,
                                                                latitude: viewModel.detail?.latitude ?? 0.0))
            }
            
            HStack{
                ImageAndText(image: "star.fill",
                             
                             title: "\(viewModel.detail?.rating ?? 0)/5")
            }
            
            VStack{
                Text(TextTheme.adress.rawValue)
                    .font(.title2)
                    .fontWeight(.semibold)
                  
                
                ImageAndText(image: "map",
                             title: viewModel.detail?.detailAdres ?? "")
                
                .onTapGesture {
                    viewModel.openMap(latitude: viewModel.detail?.latitude ?? 0.0, 
                                      longigute: viewModel.detail?.longitude ?? 0.0, name: viewModel.detail?.name ?? "")
                }
                .underline()
                
            }
            
            VStack {
                Text(TextTheme.description.rawValue)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(viewModel.detail?.description ?? "")
            }.padding()
        }
    }
    
   
}

#Preview {
    DetailInfoView(viewModel: DetailViewModel())
}
