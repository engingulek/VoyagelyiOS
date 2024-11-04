//
//  ShareViewModel.swift
//  Voyagely
//
//  Created by Engin Gülek on 4.11.2024.
//

import Foundation

class ShareViewModel : ObservableObject {
    @Published var viewShare: Share?
    @Published var error:Bool = false
    private var locationManager = LocationManager()
    
    func fetchShare(share:Share?){
        guard let getSahre = share else{
            error = true
            return
        }
        viewShare = getSahre
    }
    
    
    func onTappedLocationName(){
        guard let getSahre = viewShare else{
            error = true
            return
        }
        locationManager.goToCorrdianteOnOpen(latitude: getSahre.location.locationLatitude,
                                             longitude: getSahre.location.locationLongitude,
                                             name: getSahre.location.name)
        
    }

    
    
}
