//
//  DetailViewModel.swift
//  Voyagely
//
//  Created by Engin Gülek on 1.11.2024.
//

import Foundation
import CoreLocation
class DetailViewModel : ObservableObject {
   private var locationManager = LocationManager()
    func getAdId(id:Int) {
        
    }
    
    func openMap(latitude:Double,longigute:Double,name:String){
        locationManager.goToCorrdianteOnOpen(latitude: latitude, longitude: longigute, name: name)
    }
}
