//
//  Story.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import Foundation

struct UserShare {
    let id:Int
    let name:String
    let surname:String
    let share:Share
}

struct Share {
    let id:Int
    let shareImageURL:String
    let location:LocationForShare
    let createdDate:Date
    let seenState:Bool? = false
}


struct LocationForShare {
    let id:Int
    let name:String
    let locationLatitude:Double
    let locationLongitude:Double
}


