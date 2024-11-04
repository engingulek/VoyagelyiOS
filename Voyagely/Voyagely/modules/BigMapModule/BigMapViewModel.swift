//
//  BigMapViewModel.swift
//  Voyagely
//
//  Created by Engin Gülek on 1.11.2024.
//

import Foundation
import _MapKit_SwiftUI

class BigMapViewModel : ObservableObject {
    @Published var allOnCity:[PlaceInfoOnMap] = []
    @Published var toDetailView:Bool = false
    func onAppear() {
        fetchAllOnCity()
    }
    
    func onTappedPlace(){
        toDetailView = true
    }
    
    private func fetchAllOnCity(){
        allOnCity = [
            .init(id: 1, imageURL: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/97/1f/fc/main-lobby.jpg?w=600&h=400&s=1",
                  name: "Light Soon", categoryName: "Restaurant", rating: 4.5, comment: 20, latitude: 40.99955, longitude: 29.04578),
            
                .init(id: 2, imageURL: "https://media-cdn.tripadvisor.com/media/photo-s/0a/76/07/ad/my-chef-kadikoy-istanbul.jpg",
                      name: "Our Bar", categoryName: "Bar", rating: 4.0, comment:40, latitude: 41.00024, longitude: 29.04318)
        ]
    }
}
