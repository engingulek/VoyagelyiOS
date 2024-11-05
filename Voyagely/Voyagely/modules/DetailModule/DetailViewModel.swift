//
//  DetailViewModel.swift
//  Voyagely
//
//  Created by Engin Gülek on 1.11.2024.
//

import Foundation

class DetailViewModel : ObservableObject {
    
    private var locationManager:LocationManagerProtocol = LocationManager()
    @Published private(set) var detail : PlaceDetail?
    @Published private(set) var errorState:Bool = false
    private let service : DetailServiceProtocol = DetailService()
    
    func getAdId(id:Int) {
        if id == -1 {
            errorState = true
        }else{
            Task{
               await fetchDetail(id:id)
            }
        }
    }
    
    private func fetchDetail(id:Int) async {
        do{
            let result = try await service.fetDetailPlace(id: id)
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                detail = result
                errorState = false
            }
        }catch{
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                errorState = true
            }
        }
    }
    
    func openMap(latitude:Double,longigute:Double,name:String){
        locationManager.goToCorrdianteOnOpen(latitude: latitude, longitude: longigute, name: name)
    }
    
    func calculateDistance(longitude:Double,latitude:Double) -> String{
        
        let distance = locationManager.calculateDistance(latitude: latitude,
                                                         longitude: longitude)
       return distance
    }
}
