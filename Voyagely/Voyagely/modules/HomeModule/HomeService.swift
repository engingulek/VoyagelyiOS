//
//  HomeService.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import Foundation

protocol HomeServiceProtocol {
    func getCategories() async throws -> [Category]
    func getNearByCity(_ city:String) async throws -> [NearByPlace]
    
}

class HomeService : HomeServiceProtocol {
    private let networkManager:NetworkManagerProtocol = NetworkManager()
    func getCategories() async throws -> [Category] {
        
        do{
            let response = try await networkManager.fetch(target: .categories, responseClass: [Category].self)
            return response
        }catch{
            throw error
        }

    }
    
    func getNearByCity(_ city: String) async throws -> [NearByPlace] {
        do{
            let response = try await networkManager.fetch(target: .nearBy(city), responseClass: [NearByPlace].self)
            return response
        }catch{
            throw error
        }
    }
    
    
    
}
