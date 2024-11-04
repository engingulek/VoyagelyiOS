//
//  HomeService.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import Foundation

protocol HomeServiceProtocol {
    func getCategories() -> [Category]
    func getStories() -> [UserStory]
}

class HomeService : HomeServiceProtocol {
    func getCategories() -> [Category] {
        let list :[Category] = [
             .init(id: 1, name: "Hotel"),
             .init(id: 3, name: "Restaurnat"),
             .init(id: 4, name: "Bar")
             
         ]
        
        return list
    }
    
    func getStories() -> [UserStory] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.timeZone = TimeZone.current
        let customDate = dateFormatter.date(from: "2024-11-05 17:30")
        let list : [UserStory] = [
            .init(id: 1, name: "Engin", surname: "Gülek", stories: [
                .init(id: 1,
                      storyImageURL: "https://images.pexels.com/photos/586687/pexels-photo-586687.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                      locationInfo: "Venetian,Italy", createdDate: customDate ?? Date.now),
                .init(id: 2,
                      storyImageURL: "https://images.pexels.com/photos/2265876/pexels-photo-2265876.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                      locationInfo: "Venetian,Italy",
                      createdDate: customDate ?? Date.now)
            
            ]),
            .init(id: 2, name: "Selma", surname: "Derin", stories: [
                .init(id: 3,
                      storyImageURL: "https://images.pexels.com/photos/2659475/pexels-photo-2659475.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                      locationInfo: "Xi'an,China",
                      createdDate: customDate ?? Date.now)
            ])
        ]
        return list
    }
    
    
}
