//
//  MapViewOnHome.swift
//  Voyagely
//
//  Created by Engin Gülek on 31.10.2024.
//

import SwiftUI
import MapKit



struct MapViewOnHome: View {
    @ObservedObject var viewModel:HomeViewModel
    let manager = CLLocationManager()
    @State private var cameraPostion : MapCameraPosition = .userLocation(fallback: .automatic)
    var body: some View {
      
            VStack {
                Map(position: $cameraPostion)
                   {
                    UserAnnotation()
                    ForEach(viewModel.nearByPlaces,id: \.id) { place in
                        Annotation("", coordinate: place.getAdCLLocationCoordinate2D())
                        {
                            VStack(spacing:2){
                                Image("test1")
                                    .resizable()
                                    .frame(width: 80,height: 50)
                                Text(place.name)
                                Text(place.categoryName)
                                    .font(.caption)
                                HStack {
                                    HStack(spacing:1){
                                        Text(String(format: "%.1f", place.rating))
                                        Image(systemName: "star.fill")
                                            .foregroundStyle(.yellow)
                                        Text("\(place.comment)")
                                        Image(systemName: "message.fill")
                                            .foregroundStyle(.yellow)
                                    }
                                        .font(.caption)
                                }
                            }.padding(5)
                            .background(.white)
                            .cornerRadius(10)
                                .frame(width: 150,height: 120)
                               
                        }
                    }
            
                    
                   }
                .onAppear{
                    manager.requestWhenInUseAuthorization()
                }
            }
            
        

        
        
      
        
    }
}

#Preview {
    MapViewOnHome(viewModel: HomeViewModel(service: HomeService()))
}


