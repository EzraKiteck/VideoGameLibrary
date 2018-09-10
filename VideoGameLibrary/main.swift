//
//  main.swift
//  VideoGameLibrary
//
//  Created by Ezra Kiteck on 9/10/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import Foundation

var gameList: [Game] = []

let superMarioBros = Game(title: "Super Mario Bros.", genre: "Action/Platformer", description: "Run, jump, and WAHOO your way through worlds filled with mushrooms and turts and blocks!")

gameList.append(superMarioBros)

let legendOfZelda = Game(title: "The Legend of Zelda", genre: "Action/Adventure", description: "Save the princess from an angry pig man using a little sword, a flute, and a whole lot of fairies.")

gameList.append(legendOfZelda)

for item in gameList {
    print("\(item.title): \(item.description)")
}

print("")
