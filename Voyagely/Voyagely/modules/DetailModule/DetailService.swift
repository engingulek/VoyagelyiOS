//
//  DetailService.swift
//  Voyagely
//
//  Created by Engin Gülek on 5.11.2024.
//

import Foundation

protocol DetailServiceProtocol {
    func fetDetailPlace(id:Int) async throws -> PlaceDetail
}

class DetailService : DetailServiceProtocol {
    private let networkManager:NetworkManagerProtocol = NetworkManager()
    func fetDetailPlace(id:Int) async throws -> PlaceDetail {
        do{
            let response = try await networkManager.fetch(target: .detail(id), responseClass: PlaceDetail.self)
            return response
        }catch{
            throw error
        }
    }
    
    
}
