//
//  HomeViewModel.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import Foundation
import CoreLocation




class HomeViewModel : ObservableObject {
    
    private let service : HomeServiceProtocol
    
    @Published var categoires:[Category] = []
    @Published var usershare:[UserShare] = []
    @Published var searchText:String = ""
    @Published var searchToView : Bool = false
    @Published var toDetailView:Bool = false
    @Published var toBigMapView:Bool = false
    @Published var toStoryView:Bool = false
    @Published var nearByPlaces:[PlaceInfoOnMap] = []
    var selectedId:Int?
    var selectedShare:Share?
    let startingLocation = CLLocationCoordinate2D(latitude: 41.0082, longitude: 28.9784)
    init(service: HomeServiceProtocol) {
        self.service = service
    }
    
    func onAppear() {
        fetchStroies()
        fetchCategories()
        fetchNearByLocation()
    }
    
    private func fetchCategories(){
        categoires = service.getCategories()
    }
    
    private func fetchStroies(){
        usershare = service.getUserShare()
    }
    
    func searchAction(searchText:String){
        self.searchText = searchText
        if searchText.count > 3{
            searchToView = true
        }
    }
    
    func onTapGesturePlace(id:Int){
        selectedId = id
        toDetailView = true
    }
    
    func onTappedOpenBigMapButton(){
        toBigMapView = true
    }
    func onTapGestureShare(share:Share){
        selectedShare = share
        toStoryView = true
    }
    
    private func fetchNearByLocation(){
        nearByPlaces = [
            .init(id: 1, imageURL: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1a/97/1f/fc/main-lobby.jpg?w=600&h=400&s=1",
                  name: "Light Soon", categoryName: "Restaurant", rating: 4.5, comment: 20, latitude: 40.99955, longitude: 29.04578),
            
                .init(id: 2, imageURL: "https://media-cdn.tripadvisor.com/media/photo-s/0a/76/07/ad/my-chef-kadikoy-istanbul.jpg", 
                      name: "Our Bar", categoryName: "Bar", rating: 4.0, comment:40, latitude: 41.00024, longitude: 29.04318)
        
        ]
    }
    
  
}


