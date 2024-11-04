//
//  Story.swift
//  Voyagely
//
//  Created by Engin Gülek on 30.10.2024.
//

import Foundation

struct UserStory {
    let id:Int
    let name:String
    let surname:String
    let stories:[Story]
}

struct Story {
    let id:Int
    let storyImageURL:String
    let location:LocationForStory
    let createdDate:Date
    let seenState:Bool? = false
}


struct LocationForStory {
    let id:Int
    let name:String
    let locationLatitude:Double
    let locationLongitude:Double
}


