//
//  ListOnHome.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import SwiftUI

struct ListOnMap: View {
    @ObservedObject var viewModel:BigMapViewModel
    
    var body: some View {
        VStack(alignment:.leading) {
            ScrollView(.horizontal){
                HStack(spacing:40){
                    ForEach(viewModel.nearByCities, id: \.id){ place in
                        ListSubView(viewModel:viewModel,place: place)
                            .padding()
                            .background(.white)
                            .cornerRadius(10)
                            .onTapGesture {
                                viewModel.onTappedPlace()
                            }
                    }
                }
            }
        }.padding()
    }
}


private struct ListSubView : View {
    @ObservedObject var viewModel : BigMapViewModel
    let place:NearByPlace
    var body: some View {
        VStack(alignment:.leading){
            AsyncImageLoad(imageURL: place.baseImage)
                .frame(width: 200)
                .frame(height: 150)
                .cornerRadius(10)
            
            VStack(alignment:.leading,spacing:10){
                Text(place.name)
                    .font(.title2)
                Text("\(place.district)")
                VStack(alignment:.leading){
                    HStack{
                        Image(systemName: "star")
                        Text("\(place.rating) Rating")
                    }
                    HStack{
                        HStack{
                            Image(systemName: "mappin.and.ellipse")
                            Text(viewModel.calculateDistance(longitude: place.longitude,
                                                             latitude: place.latitude))
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ListOnMap(viewModel: BigMapViewModel())
}
