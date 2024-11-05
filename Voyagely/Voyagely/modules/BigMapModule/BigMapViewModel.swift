//
//  BigMapViewModel.swift
//  Voyagely
//
//  Created by Engin Gülek on 1.11.2024.
//

import Foundation
import _MapKit_SwiftUI

class BigMapViewModel : ObservableObject {
    @Published private(set) var nearByCities:[NearByPlace] = []
    @Published var toDetailView:Bool = false
    private let service:BigMapServiceProtocol = BigMapService()
    private let locationManager:LocationManagerProtocol = LocationManager()
    
    func task()  async{
       await fetchNearByCities(city: "Istanbul")
    }
    
    func onTappedPlace(){
        toDetailView = true
    }
    
    private func fetchNearByCities(city:String) async{
        do{
            let list = try await service.getNearByCity(city)
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                nearByCities = list
            }
        }catch{
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                nearByCities = []
            }
        }
    }
    
    func calculateDistance(longitude:Double,latitude:Double) -> String{
        
        let distance = locationManager.calculateDistance(latitude: latitude,
                                                         longitude: longitude)
       return distance
    }
}
