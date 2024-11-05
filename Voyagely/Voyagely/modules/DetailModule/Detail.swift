//
//  Detail.swift
//  Voyagely
//
//  Created by Engin Gülek on 5.11.2024.
//

import Foundation


// MARK: - PlaceDetail
struct PlaceDetail: Decodable {
    let id: Int
    let baseImage: String
    let imageList: [String]
    let name: String
    let priceScale: Int
    let city, district: String
    let rating: Int
    let detailAdres, description: String
    let latitude, longitude: Double
    let category: Category
}
