//
//  HomeService.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import Foundation

protocol HomeServiceProtocol {
    func getCategories() -> [Category]
    func getStories() -> [Story]
}

class HomeService : HomeServiceProtocol {
    func getCategories() -> [Category] {
        let list :[Category] = [
             .init(id: 1, name: "Hotel"),
             .init(id: 2, name: "Park"),
             .init(id: 3, name: "Restaurnat"),
             .init(id: 4, name: "Musium")
             
         ]
        
        return list
    }
    
    func getStories() -> [Story] {
        let list : [Story] = [
            .init(id: 1,
                  user: .init(id: 1, name: "Engin", surname: "Gülek"),
                  storyImageURL: "https://www.bizevdeyokuz.com/wp-content/uploads/eiffel-kulesi-paris-sokaklari.jpg",
                  locationInfo: "Istanbul/Türkiye", date: "Test Data"),
            .init(id: 2,
                  user: .init(id: 2, name: "Can", surname: "Derya"),
                  storyImageURL: "https://www.bizevdeyokuz.com/wp-content/uploads/eiffel-kulesi-paris-sokaklari.jpg",
                  locationInfo: "Istanbul/Türkiye", date: "Test Data"),
            
        
        ]
        return list
    }
    
    
}
