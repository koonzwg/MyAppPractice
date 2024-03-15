//: [Previous](@previous)

import Foundation

// Day 11 - Access control, static properties and methods, and checkpoint 6
// How to limit access to internal data using access control

/*
 By default, swift's structs allow you to access their properties and method freely, but often that isn't what you want - sometimes you want to hide some data from external access
 */

/*struct BankAccount {
    private var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

// This has methods to deposit and withdraw money from a bank account, and should be used like this:
var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)


if success {
    print("Withdrew money succeessfully")
} else {
    print("Failed to get the money")
}

// To tell Swift that funds should be accessible only inside the struct - by methods that belong to the struct, as well as any computed properties, property observers and so on
// Just add the 'private' keyword
// private var funds = 0

// No accessing funds from outside the struct isn't possible, but it is possible inside both deposit() and withdraw()

// This is called access control, because it controls how a structs properties and methods can be accessed from outside the struct

/*
 Swift provides you with several options, but when you're learning you'll only need a handful:
 1. private - for "Don't let anything outside the struct use this."
 2. fileprivate - for "don't let anything outside the current file use this."
 3. public - for "let anyone, anywhere use this."
 4. private(set) - for "let anyone read this property, but only let my methods write it."
 Ex. if you used this with BankAccount, it would mean you could print account.funds outside the struct, but only deposit() and withdraw() could actually change the value
 */

// If you use private access control for one or more properties, chances are you'll need to create your own initializer


// Static properties and methods

/*
 Sometimes you want to add a property or method to a struct itself, rather than to one particular instance of the struct, which allows you to use them directly.
 This technique is used a lot in SwiftUI for 2 things:
 1. Creating example data
 2. Storing fixed data that needs to be accessed in various places
 */

struct School {
    // Static keyword means both the studentCount and add() method belong to the School struct itself, rather than to individual instances of the struct
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

// Static means they don't exist uniquely on instance of the struct

/*
 If you want to mix and match static and non-static properties and methods, there are 2 rules:
 1. To access non-static code from static code... you're out of luck: static properties and methdos can't refer to non-static properties and methods because it just doesn't make sense - which instance of School would you be referring to?
 2. To access static code from non-static code, always use your types name such as School.studentCount. You can also use Self to refer to the current type
 
 self and Self are different and mean different things
 
 self: refers to the current value of the struct
 Self: refers to the current type
 
 all data types start with a capital letter
 */

// Use static properties to organize common data in apps

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https//"
}

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "williamkoonz", password: "hairforce1")
} */


// Checkpoint 6
/*
 Create a struct to store information about a car
 1. Include the model
 2. Include number of seats
 3. Include current gear
 4. Method to change gears up or down
 5. What data should be variables/constants
 6. What data should be exposed publicly
 7. Should the gear changing method validate its input somehow
 */

struct Car {
    let model: String
    let numberOfSeats: Int
    // private(set) modifier is used to restrict the write access of the currentGear property to within the Car struct, while still allowing read access (getter)
    private(set) var currentGear: Int
    
    init(model: String, numberOfSeats: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        self.currentGear = 0
    }
    
    mutating func changeGear(by offset: Int) {
        let newGear = currentGear + offset
        if newGear >= 0 {
            currentGear = newGear
        }
    }
}

var myCar = Car(model: "Honda", numberOfSeats: 5)
print(myCar.model)
print(myCar.currentGear)
myCar.changeGear(by: -2)
print(myCar.currentGear)
myCar.changeGear(by: 10)
print(myCar.currentGear)
