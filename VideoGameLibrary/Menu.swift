//
//  Menu.swift
//  VideoGameLibrary
//
//  Created by Ezra Kiteck on 9/11/18.
//  Copyright © 2018 Ezra Kiteck. All rights reserved.
//

import Foundation

class Menu {
    
    //Properties
    var quitting = false //When this is true, we should quit running the library.
    var validInput = false
    var gameList: [Game]
    
    //Initializer
    init(gameList: [Game]) {
        self.gameList = gameList
    }
    
    //Runs the menu
    func go () {
        //This function is going to handle making the menu run.  It will display the menu and take user input until the user wishes to quit the application.
        
        while !quitting {
            printMenu()
        }
    }
    
    //Prints Menu Options
    func printMenu() {
        //This should contain a print statement that contatins a formatted list of options.
        //Options: Add Game, Remove game, list available games, check out game, check in game, list checked out games, quit
        print("""

            What would you like to do?
1. List Available Games     2. List Unavailable Games
3. Check in a Game          4. Check out a Game
5. Add a Game               6. Remove a Game
7. List all Games           8. Quit

""")
        AskForInput()
    }
    
    //Asks for input
    func AskForInput() {
        let response = readLine()
        if let request = response {
            switch Int(request) {
            case 1:
                ListAvailableGames()
            case 2:
                ListUnavailableGames()
            case 3:
                CheckInGames()
            case 4:
                CheckOutGames()
            case 5:
                AddGame()
            case 6:
                RemoveGames()
            case 7:
                ListGames()
            case 8:
                Quit()
            default:
                print("Please enter a valid number.")
                AskForInput()
            }
        } else {
            print("Please enter a valid number.")
            AskForInput()
        }
    }
    
    //Lists all games
    func ListGames() {
        var total = 0
        for item in gameList {
            print(item.title)
            total += 1
        }
        if total == 0 {
            print("There is no game. Try adding some!")
        }
    }
    
    //Lists all games that are checked out
    func ListAvailableGames() {
        var total = 0
        for game in gameList {
            if !game.checkedIn {
                print("\(game.title)")
                total += 1
            }
        }
        if total == 0 {
            print("Sorry, no games are checked out for you to play.")
        }
    }
    
    //Lists all games that are checked in
    func ListUnavailableGames() {
        var total = 0
        for game in gameList {
            if game.checkedIn {
                print("\(game.title)")
                total += 1
            }
        }
        if total == 0 {
            print("All games are checked out of the library!")
        }
    }
    
    //Used to add a game
    func AddGame() {
        print("What is the title of the game?")
        let answer = readLine()
        if let gameTitle = answer {
            let newGame = Game(title: gameTitle)
            gameList.append(newGame)
            print("\(newGame.title) has been added.")
        } else {
            print("Please enter a valid name")
            AddGame()
        }
    }
    
    //Removes selected game
    func RemoveGames() {
        if gameList.count == 0 {
            print("You don't have any games! Try adding some.")
        } else {
            print("What game do you want to remove?")
            for i in 0..<gameList.count {
                print("\(i): \(gameList[i].title)")
            }
            var answer = Int(readLine()!)
            while answer == nil || answer! < 0 || answer! > gameList.count - 1{
                print("Not valid input")
                answer = Int(readLine()!)
            }
            print("\(gameList[Int(answer!)].title) has been removed.")
            gameList.remove(at: answer!)
        }
    }
    
    //Checks out a game that is checkedIn
    func CheckOutGames() {
        print("Here are the games available to check out.")
        var total = 0
        for i in 0..<gameList.count {
            if gameList[i].checkedIn {
                print("\(i): \(gameList[i].title)")
                total += 1
            }
        }
        if total == 0 {
            print("...Wait, there are no games available for you to check out!")
        } else {
            print("Please enter the index of the game you want to check out.")
            var answer = Int(readLine()!)
            while answer == nil || answer! < 0 || answer! > gameList.count - 1 || !gameList[answer!].checkedIn {
                print("Not valid input")
                answer = Int(readLine()!)
            }
            print("\(gameList[answer!].title) has been checked out.")
            gameList[answer!].checkedIn = false
        }
    }
    
    //Checks in a game that is !checkedIn
    func CheckInGames() {
        print("Here are the games available to check in.")
        var total = 0
        for i in 0..<gameList.count {
            if !gameList[i].checkedIn {
                print("\(i): \(gameList[i].title)")
                total += 1
            }
        }
        if total == 0 {
            print("...Wait a minute, all the games are checked in!")
        } else {
            print("Please enter the index of the game you want to check in.")
            var answer = Int(readLine()!)
            while answer == nil || answer! < 0 || answer! > gameList.count - 1 || gameList[answer!].checkedIn {
                print("Not valid input")
                answer = Int(readLine()!)
            }
            print("\(gameList[answer!].title) has been checked in.")
            gameList[answer!].checkedIn = true
        }
    }
    
    //Quits Application
    func Quit() {
        print("Quitting Application.  Thanks for using the video game library!")
        quitting = true
    }
    
}
