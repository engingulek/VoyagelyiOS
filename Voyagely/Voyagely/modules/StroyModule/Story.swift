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
    let locationInfo:String
    let createdDate:Date
    let seenState:Bool? = false
}





