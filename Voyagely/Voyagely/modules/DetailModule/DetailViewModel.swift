//
//  DetailViewModel.swift
//  Voyagely
//
//  Created by Engin Gülek on 1.11.2024.
//

import Foundation

class DetailViewModel : ObservableObject {
    private var locationManager:LocationManagerProtocol = LocationManager()
    //TODO: Empty data will be added
    @Published var detail : PlaceDetail?
    
    private var service : DetailServiceProtocol = DetailService()
    func getAdId(id:Int?) {
        guard let id = id else {return}
        Task{
           await fetchDetail(id:id)
        }
    }
    
    private func fetchDetail(id:Int) async {
        do{
            let result = try await service.fetDetailPlace(id: id)
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                detail = result
                
                
                
            }
        }catch{
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                detail = nil
                
                
            }
        }
    }
    
    func openMap(latitude:Double,longigute:Double,name:String){
        print(latitude)
        print(longigute)
        locationManager.goToCorrdianteOnOpen(latitude: latitude, longitude: longigute, name: name)
    }
    
    func calculateDistance(longitude:Double,latitude:Double) -> String{
        
        let distance = locationManager.calculateDistance(latitude: latitude,
                                                         longitude: longitude)
       return distance
    }
}
