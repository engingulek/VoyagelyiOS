//
//  NearByPlace.swift
//  Voyagely
//
//  Created by Engin Gülek on 1.11.2024.
//

import Foundation
import CoreLocation


struct NearByPlace:Decodable {

        let id: Int
        let baseImage: String
        let name: String
        let priceScale: Int
        let district: String
        let rating: Int
        let latitude, longitude: Double
        let category: Category
    
    func getAdCLLocationCoordinate2D() -> CLLocationCoordinate2D {
       return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
   }
    
}
