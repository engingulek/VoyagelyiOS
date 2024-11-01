//
//  NearByPlace.swift
//  Voyagely
//
//  Created by Engin Gülek on 1.11.2024.
//

import Foundation
import CoreLocation
struct NearByPlace {
    let id:Int
    let imageURL:String
    let name:String
    let categoryName:String
    let rating:Double
    let comment:Int
    let latitude:Double
    let longitude:Double
    
     func getAdCLLocationCoordinate2D() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

