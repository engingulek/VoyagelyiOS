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
    
    static var defaultData : NearByPlace =   NearByPlace(id: 2, imageURL: "https://media-cdn.tripadvisor.com/media/photo-s/0a/76/07/ad/my-chef-kadikoy-istanbul.jpg", name: "Our Bar", categoryName: "Bar", rating: 4.0, comment:40, latitude: 41.00024, longitude: 29.04318)
}

