//
//  User.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import Foundation

struct Category : Decodable {
    let id:Int
    let name:String
}


struct User {
    let id:Int
    let name:String
    let surname:String
}
