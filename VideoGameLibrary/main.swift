//
//  main.swift
//  VideoGameLibrary
//
//  Created by Ezra Kiteck on 9/10/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import Foundation

print("""
                    Welcome!
""")

var gameList: [Game] = []

let superMarioBros = Game(title: "Super Mario Bros.")
gameList.append(superMarioBros)

let legendOfZelda = Game(title: "The Legend of Zelda")
gameList.append(legendOfZelda)


let mainMenu = Menu(gameList: gameList)

mainMenu.go()
