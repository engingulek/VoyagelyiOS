//
//  HomeService.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import Foundation

protocol HomeServiceProtocol {
    func getCategories() -> [Category]
    func getUserShare() -> [UserShare]
}

class HomeService : HomeServiceProtocol {
    func getCategories() -> [Category] {
        let list :[Category] = [
             .init(id: 1, name: "Caffe"),
             .init(id: 3, name: "Restaurnat"),
             .init(id: 4, name: "Bar")
             
         ]
        
        return list
    }
    
    func getUserShare() ->  [UserShare] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        dateFormatter.timeZone = TimeZone.current
        let customDate = dateFormatter.date(from: "2024-11-05 17:30")
        let list : [UserShare] = [
            .init(id: 1, name: "Engin", surname: "Gülek", share:
                    
                .init(id: 2,
                      shareImageURL: "https://images.pexels.com/photos/1581384/pexels-photo-1581384.jpeg?auto=compress&cs=tinysrgb&w=1200",
                      location: .init(id: 1, name: "Night Restaurant", locationLatitude:40.99955 , locationLongitude: 29.04578),
                      createdDate: customDate ?? Date.now)
                
            
            ),
            .init(id: 2, name: "Selma", surname: "Derin", share:
                .init(id: 1,
                      shareImageURL: "https://images.pexels.com/photos/1546039/pexels-photo-1546039.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                      location: .init(id: 2, name: "White Bar", locationLatitude:41.00024 , locationLongitude: 29.04318),
                      createdDate: customDate ?? Date.now)
            )
        ]
        return list
    }
    
    
}
