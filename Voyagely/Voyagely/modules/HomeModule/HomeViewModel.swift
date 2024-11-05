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
    @Published var usershare:[UserShare] = []
    @Published var searchText:String = ""
    @Published var searchToView : Bool = false
    @Published var toDetailView:Bool = false
    @Published var toBigMapView:Bool = false
    @Published var toStoryView:Bool = false
    @Published var errorState:Bool = false
    @Published var loadingAction:Bool = true
    @Published var selectedCategoryId : Int = 1
    @Published var locationInfo:(city:String,country:String) = ("","")
    var selectedId:Int?
    var selectedShare:Share?
    
    init(service: HomeServiceProtocol) {
        self.service = service
    }
    
    func task() async {
        // fetchStroies()
        await fetchCategories()
        
        await fetchNearByCities(city: "Istanbul")
    }
    
    func onAppear(){
        getLocationInfo()
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
                errorState = false
                loadingAction = false
                
            }
        }catch{
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                categoires = []
                errorState = true
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
                errorState = false
                loadingAction = false
                
            }
        }catch{
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                categoires = []
                errorState = true
                loadingAction = false
                
            }
        }
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
    
    func onTappedGestureCategory(selectedId:Int) {
        selectedCategoryId =  selectedId
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
    
    func calculateDistance(longitude:Double,latitude:Double) -> String{
        
        let distance = locationManager.calculateDistance(latitude: latitude, 
                                                         longitude: longitude)
       return distance
    }
}


