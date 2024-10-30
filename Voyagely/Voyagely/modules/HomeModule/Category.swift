//
//  Category.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import Foundation

struct Category {
    let id:Int
    let name:String
    
    static var list :[Category] = [
        .init(id: 1, name: "Hotel"),
        .init(id: 2, name: "Park"),
        .init(id: 3, name: "Restaurnat"),
        .init(id: 4, name: "Musium")
        
    
    ]
}
