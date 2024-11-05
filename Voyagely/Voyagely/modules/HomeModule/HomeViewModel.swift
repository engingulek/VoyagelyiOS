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
    @Published var categoires:[Category] = []
    @Published var nearByCities: [NearByPlace] = []
    @Published var toDetailView:Bool = false
    @Published var toBigMapView:Bool = false
    
    
    @Published var loadingAction:Bool = true
    @Published var selectedCategoryId : Int = 1
    var selectedId:Int?
    private var tempsNearbyPlace:[NearByPlace] = []
    
    init(service: HomeServiceProtocol) {
        self.service = service
    }
   
    
    private func getLocationInfo(){
        let locationInfo = locationManager.locationInfo
       
    }
    
        
    private func fetchCategories() async {
        do{
            let list = try await service.getCategories()
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                categoires = list
                loadingAction = false
                
            }
        }catch{
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                categoires = []
                loadingAction = false
                
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
                
            }
        }catch{
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                nearByCities = []
                loadingAction = false
                
            }
        }
    }
    
   
    
  
}


extension HomeViewModel {
    
    func task() async {
        // fetchStroies()
        await fetchCategories()
        
        await fetchNearByCities(city: "Istanbul")
    }
    
    func onAppear(){
        getLocationInfo()
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
        selectedId = id
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
