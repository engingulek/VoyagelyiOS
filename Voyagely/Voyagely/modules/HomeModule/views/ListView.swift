//
//  ListV.swift
//  Voyagely
//
//  Created by Engin Gülek on 3.11.2024.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var viewModel:HomeViewModel
    var router : HomeViewRouterProtocol
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        VStack{
            PrimaryTitle(text: TextTheme.nearBy.rawValue)
            if viewModel.nearByCities.isEmpty {
                VStack(alignment:.center){
                    Text("Place Not Fount")
                        .foregroundStyle(.red)
                        .fontWeight(.semibold)
                        .font(.title2)
                    
                }
               
            }else{
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.nearByCities,id:\.id) { place in
                        ListViewCell(place: place,viewModel: viewModel)
                            .padding(.horizontal)
                            .onTapGesture {
                                viewModel.onTapGesturePlace(id: 1)
                            }
                    }
                }
            }
          
        }
    }
}


private struct ListViewCell : View {
    let place:NearByPlace
    @ObservedObject var viewModel:HomeViewModel
    var body: some View {
        VStack(alignment:.leading){
            ZStack(alignment:.topLeading) {
                AsyncImageLoad(imageURL: place.baseImage)
                    .frame(width: 180,height: 200)
                Text(place.category.name)
                    .font(.footnote)
                    .foregroundStyle(.white)
                    .padding(5)
                    .background(.gray.opacity(0.3))
                    .padding()
            }
            VStack(alignment:.leading){
                HStack{
                    Text(place.name)
                        .font(.title3)
                    HStack(spacing:1) {
                        ForEach(Array(repeating: "$", count: place.priceScale - 1), id: \.self) { price in
                            Text(price)
                        }
                    }
                  
                }
                HStack{
                    ImageAndText(image: "mappin", title: place.district)
                    Spacer()
                    XSText(text:viewModel.calculateDistance(longitude: place.longitude, latitude: place.latitude))
                 
                }
            }.padding(.horizontal)
                .padding(.bottom)
        }.background(Color.white)
        .cornerRadius(10)
            .padding(.bottom)
    }
}

#Preview {
    ListView(viewModel: HomeViewModel(service: HomeService()), router: HomeViewRouter())
}
