//
//  LocationManager.swift
//  Voyagely
//
//  Created by Engin Gülek on 3.11.2024.
//

import Foundation
import CoreLocation
import MapKit
class LocationManager {
    func goToCorrdianteOnOpen(latitude:Double,longitude:Double,name:String){
        let destinationCoordinate = CLLocationCoordinate2D(latitude:latitude,longitude: longitude)
         let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate)
         let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
         destinationMapItem.name = name
         
         destinationMapItem.openInMaps(launchOptions: [
             MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
         ])
    }
}