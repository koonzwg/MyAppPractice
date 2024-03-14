//: [Previous](@previous)

import Foundation

//Day 10 - Structs, computed properties, and property observers
// Structs - Allows you to create your own custom complex data types out of several small types complete with their own variables and their own functions
/*struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()
*/
// Things get more interesting when you want to have values that can change. For exampl, an employee struct that can take vacation as needed
/*struct Employee {
    let name: String
    var vacationRemaining: Int
    
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5)
print(archer.vacationRemaining)

// Any functions that only read data are fine as they are, but any that change data belonging to the struct must be marked with a special mutating keyword

/*
 1. Variables and constants that belong to structs are called properties
 2. Functions that belong to structs are called methods
 3. When we create a constant or variable out of a struct, we call that an instance - you might create a dozen unique instances of the Album struct, for example
 4. When we create instances of structs we do so using an initializer like this: Album(title: "Wings", artist: "BTS", year: 2016)
 */

// Swift silently creates a special function inside the struct called init() using all the properties of the struct as its parameters. Then automatically treats the following 2 pieces of code as the same
var archer1 = Employee(name: "Sterling Archer", vacationRemaining: 14)
var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)
*/

// How to compute property values dynamically
/*
 Structs can have 2 kinds of properties:
 1. A stored property - a variable or constant that holds a piece of data inside an instance of the struct
 2. A computed property - calculates the value of the property dynamically every time it's accessed
 
 This means computed properties are a blend of both stored properties and functions: they are accessed like stored properties but work like functions
 */
struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var archer = Employee(name: "sterling archer", vacationAllocated: 14)
archer.vacationTaken += 4
archer.vacationRemaining = 5
print(archer.vacationAllocated)

/*archer.vacationTaken += 4
print(archer.vacationRemaining)
archer.vacationTaken += 4
print(archer.vacationRemaining)*/

// We're reading what looks like a property, but behind the scenes swift is running some code to calculate its value every time
// We can't write to it, though, because we haven't told Swift how that should be handled. To fix that we need to provide both a getter and a setter

// Getter: code that reads
// Setter: code that writes

//newValue is automatically provided to us by swift, and stores whatever value the user was trying to assign to the property


// How to take action when a property changes

// Swift allows us to create property observers which are special pieces of code that run when properties change.
/*
 These take 2 forms:
 1. a didSet observer to run when the property just changed
 2. a willSet observer to run before the property changed
 */

/*struct Game {
    var score = 0
}

var game = Game()
game.score += 10
print("Score is now \(game.score)")
game.score -= 3
print("Score is now \(game.score)")
game.score += 1*/

// The code above has a bug, at the end the score changed without being printed. With property observers you can solve this problem by attaching the print() call directly to the property using didSet, so that whenever it changes - wherever it changes - we will always run some code

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

// Swift provides the constant oldValue inside didSet, in case you need to have custom functionality based on what you were changing from.
// Theres also a willSet variant that runs some code before the property changes, which in turn provides the new value that will be assigned in case you want to take different action based on that

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is: \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")

// in practice willSet is used much less than didSet


// How to create custom initializers

/*
 Initializers are specialized methods that are designed to prepare a new struct instance to be used.
 You can also create your own as long as you follow one golden rule:
 1. All properties must have a value by the time the initializer ends
 */

/*struct Player {
    let name: String
    let number: Int
    
    // Now the initializer is owned by us so we can add extra functionality there if needed
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
}*/

/*
 Few things to notice:
 1. There is no func keyword. Yes, this looks like a function in terms of its syntax, but Swift treats initializers specially.
 2. Even though this creates a new Player instance, initializers never explicitly have a return type - they always return the type of data they belong to.
 3. I've used self to assign parameters to properties to clarify we mean "assign the name parameter to my name property"
 
 by writing self.name and self.number, you are clarifying you mean "the name/number property that belongs to my current instance
 */

//let player = Player(name: "Megan R", number: 15)
// just remember the golden rule: all properties must have a value by the time the initializer ends. If you do not provide a value for number inside the initializer, swift would refuse to build your code

struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)
