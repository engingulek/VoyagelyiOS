//
//  LocationManager.swift
//  Voyagely
//
//  Created by Engin Gülek on 3.11.2024.
//

import Foundation
import CoreLocation
import MapKit
import _MapKit_SwiftUI

protocol LocationManagerProtocol:AnyObject{
    func goToCorrdianteOnOpen(latitude:Double,longitude:Double,name:String)
    var cameraPostion : MapCameraPosition {get}
    var currentLocation:CLLocation? {get}
    func calculateDistance(latitude:Double,longitude:Double) -> String
    var locationInfo : (city:String,disctrict:String) {get}
    
}

class LocationManager :NSObject, LocationManagerProtocol, CLLocationManagerDelegate {
    @Published var locationInfo: (city:String,disctrict:String) = ("","")
    private var locationManager: CLLocationManager
    var cameraPostion: MapCameraPosition =  .userLocation(fallback: .automatic)
    var currentLocation: CLLocation?
    
    override init() {
        locationManager = CLLocationManager()
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        getLocationCityAndCountry()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        currentLocation = locations.last
        getLocationCityAndCountry()
    }
    
    func goToCorrdianteOnOpen(latitude:Double,longitude:Double,name:String){
        let destinationCoordinate = CLLocationCoordinate2D(latitude:latitude,longitude: longitude)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        destinationMapItem.name = name
        
        destinationMapItem.openInMaps(launchOptions: [
            MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking
        ])
    }
    
    func calculateDistance(latitude: Double, longitude: Double) -> String {
        guard let currentLocation = currentLocation else {return ""}
        let ditance = currentLocation.distance(from: CLLocation(latitude: latitude, longitude: longitude))
        if ditance < 1 {
            return  String(format: "%.1f", ditance / 1000) + "km"
        }
        else{
            return   String(format: "%.1f", ditance ) + "m"
        }
    }
    
   private func getLocationCityAndCountry() {
        var city = ""
        var country = ""
        guard let currentLocation = currentLocation else {return }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(currentLocation) { placemarks, error in
            guard error == nil else {
                return
            }
            if let placemark = placemarks?.first {
                guard let localCity =  placemark.administrativeArea else {return}
                guard let localCountry =  placemark.country else {return}
                city = localCity
                country = localCountry
               
            }
        }
       locationInfo = (city,country)
    }
}
