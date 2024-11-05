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
    private let locationManager:LocationManagerProtocol = LocationManager()
    @Published private(set) var categoires:[Category] = []
    @Published  private(set) var nearByCities: [NearByPlace] = []
    @Published   var toDetailView:Bool = false
    @Published  var toBigMapView:Bool = false
    @Published private(set) var loadingAction:Bool = true
    @Published private(set) var selectedCategoryId : Int = 1
    @Published private(set) var errorState:Bool = false
    
    var selectedPlaceId:Int = -1
    private var tempsNearbyPlace:[NearByPlace] = []
    
    init(service: HomeServiceProtocol) {
        self.service = service
    }
    
    private func fetchCategories() async {
        do{
            let list = try await service.getCategories()
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                categoires = list
                loadingAction = false
                errorState = false
                
            }
        }catch{
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                categoires = []
                loadingAction = false
                errorState = true
                
            }
        }
    }
    
    private func fetchNearByCities(city:String) async {
        do{
            let list = try await service.getNearByCity(city)
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                nearByCities = list
                tempsNearbyPlace = nearByCities
                loadingAction = false
                errorState = false
                
            }
        }catch{
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                nearByCities = []
                loadingAction = false
                errorState = true
            }
        }
    }
}


extension HomeViewModel {
    
    func task() async {
        let locationInfo = self.locationManager.locationInfo
        await fetchCategories()
        await fetchNearByCities(city: locationInfo.city)
    }
    
    func onTappedGestureCategory(selectedId:Int) {
        selectedCategoryId =  selectedId
        if selectedId == 1 {
            nearByCities = tempsNearbyPlace
        }else{
            nearByCities = tempsNearbyPlace.filter{ $0.category.id == selectedId}
        }
    }
    
    func onTapGesturePlace(id:Int){
        selectedPlaceId = id
        toDetailView = true
    }
    
    func onTappedOpenBigMapButton(){
        toBigMapView = true
    }
    
    func calculateDistance(longitude:Double,latitude:Double) -> String{
        
        let distance = locationManager.calculateDistance(latitude: latitude,
                                                         longitude: longitude)
        return distance
    }
}
