//
//  GameClass.swift
//  VideoGameLibrary
//
//  Created by Ezra Kiteck on 9/10/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import Foundation

class Game {
    
    let title: String
    let genre: String
    let description: String
    var checkedIn: Bool = true
    var dueDate: Date? = nil
    
    init(title: String, genre: String, description: String) {
        self.title = title
        self.genre = genre
        self.description = description
    }
}
