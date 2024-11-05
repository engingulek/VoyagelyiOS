//
//  BigMapService.swift
//  Voyagely
//
//  Created by Engin Gülek on 5.11.2024.
//

import Foundation

protocol BigMapServiceProtocol {
    func getNearByCity(_ city:String) async throws -> [NearByPlace]
}

class BigMapService : BigMapServiceProtocol {
    private let networkManager:NetworkManagerProtocol = NetworkManager()
    func getNearByCity(_ city: String) async throws -> [NearByPlace] {
        do{
            let response = try await networkManager.fetch(target: .nearBy(city), responseClass: [NearByPlace].self)
            return response
        }catch{
            throw error
        }
    }
    
    
}
