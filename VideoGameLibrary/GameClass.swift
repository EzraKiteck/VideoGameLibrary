//
//  GameClass.swift
//  VideoGameLibrary
//
//  Created by Ezra Kiteck on 9/10/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import Foundation

enum ESRBRating {
    case E
    case T
    case M
}

class Game {
    
    //Properties
    let title: String
    var checkedIn: Bool = true
    var dueDate: Date? = nil
    
    init(title: String) {
        self.title = title
    }
}
