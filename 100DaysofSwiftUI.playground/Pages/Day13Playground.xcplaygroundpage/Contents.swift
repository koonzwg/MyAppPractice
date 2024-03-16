//: [Previous](@previous)

import Foundation

// Day 13 - Protocols, extensions and checkpoint 8
// Protocols - How to create and use protocols

// Protocols are a bit like contracts in Swift: They let you define what kinds of functionality you expect a data type to support and swift ensures that the rest of your code follows those rules


// protocols let you define a series of properties and methods that you want to use. They don't implement those properties and methods - they don't actually put any code behind it. They just say that the properties and methods must exist, similar to a blueprint

/*protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

/*
 Let's break down the code above:
 - To create a new protocol you write 'protocol' followed by the protocol name. This is a new type, so we need to use camel case starting with an uppercase letter
 - Inside the protocol you list all the methods required in order for this protocol to work the way you expect
 - These methods do not contain any code inside - there are no function bodies provided here. Instead, you're specifying the method names, parameters and return types. You can also mark methods as being throwing or mutating if needed
 */

// How does it help?
// Well now you can design types that work with that protocol. This means creating new structs, classes or enums that implement the requirements for that protocol, which is a process we call adopting or conforming to the protocol.

struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
    
    func openSunroof() {
        print("It's a nice day!")
    }
}

func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
           print("That's too slow! I'll try a different vehicle.")
       } else {
           vehicle.travel(distance: distance)
       }
}

let car = Car()
commute(distance: 100, using: car)

struct Bicycle: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

let bike = Bicycle()
commute(distance: 50, using: bike)

// So, protocols let you talk about the kind of functionality you want to work with, rather than the exact types. Rather than saying "This parameter must be a car" you can instead say "this parameter can be anything at all, as long as it's able to estimate travel time and move to a new location."

// As well as methods, you can also write protocols to describe properties that must exist on conforming types. To do this, write var, then a property name, then list whether it should be readable and/or writeable.

// Example: You could specify that all types that conform Vehicle must specify how many seats they have and how many passengers they currntly have

protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

/*
 This adds 2 properties:
 1. A string called name, which must be readable.  That might mean it's a constant, but it might also be a computed property with a getter.
 2. An integer called currentPassengers, which must be read-write. That might mean it's a variable, but it might also be a computed property with a getter and setter
 
 To fix Car and Bicycle to conform to the protocol, you can add the following properties to Car
 */

let name = "Car"
var currentPassengers = 1

// and to bicycle

let name = "Bicycle"
var currentPassengers = 1


// How to use opaque return types

// Returning a protocol from a function is useful because it lets you hide information
// Rather than stating the exact type that is being returned, you get to focus on the functionality that is returned.

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

// The advantage is swift always knows the real underlying data type

// This is used in SwiftUI with 'some View' which means that some kind of view screen will be returned but we don't want to have to write out its mile-long type
// At hte same time Swift knows the real underlying type because thats how opaque return types work.


// Extensions - How to create and use extensions

// Extensions let you add functionality to any type, whether you created it or someone else did - even Apple's own types

var quote = "   The truth is rarely pure and never simple   "
// let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewLines)

// whitespacesAndNewLines comes from Apple's foundation api and so does trimmingCharacters(in:)

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewLines)
    }
}

/*
 Lets break down the above code
 1. You start with the extension keyword, which tells Swift you want to add functionality to an existing type
 2. Which type? Well, that comes next: we want to add functionality to String
 3. Now we open a brace, and all the code until the final closing brace is there to be added to strings
 4. We're adding a new method called trimmed(), which returns a new string.
 5. Inside there we call the same method as before: trimmingCharacters(in:), sending back its result
 6. Notice how we can use self here - that automatically refers to the current string. This is possible because we're currently in a string extension
 */

// Saves some typing, but is it regular than a regular function?
let trimmed = quote.trimmed()

func trim(_ string: String) -> String {
    string.trimmingCharacters(in: .whitespacesAndNewlines)
}

let trimmed2 = trim(quote)

/*
 The above is less code than an extension, both in terms of making the function and using it. This kind of function is called a global function, because it's available everywhere in the project.
 The extension has a number of benefits over the global function, including:
 1. When you type 'quote.' Xcode brings up a list of methods on the string, including all the ones we add in extensions. This makes our extra functionality easy to find.
 2. Writing global functions makes your code rather messy - they are hard to organize and hard to keep track of. On the other hand, extensions are naturally grouped by the data type they are extending
 3. Because your extension methods are a full part of the original type, they get full access to the type's internal data. That means they can use properties and methods marked with 'private' access control, for example
 */

// If you wanted to modify the string directly you could add this to the extension
mutating func trim() {
    self = self.trimmed()
}

quote.trim()

// If you're returning a new value rather than changing it in place, you should use word endings like ed or ing, like reversed()

// You can also use extensions to add properties to types, but there is one rule:
// 1. They must only be computed properties, not stored properties

var lines: [String] {
    self.components(separatedBy: .newLines)
}

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

// Whether they are single lines or complex pieces of functionality, extensions always have the same goal: to make your code easier to write, easier to read and easier to maintain in the long term

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
    
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

// If swift were to keep the memberwise initializer in this instance, it would skip our logic for calculating the approximate reading time
// However - sometimes you want both - you want the ability to use a custom initializer, but also retain Swift's automatic memberwise initializer.
// If we implement a custom initializer inside an extension, then Swift won't disable the automatic memberwise initializer
// So if you wanted the Book struct to have the default memberwise initializer as well as the custom initializer, you would place the custom one in an extension

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)


// Protocol extensions - How to create and use protocol extensions

/*
 Protocols - let you define contracts that conforming types must adhere to
 Extensions - let you add functionality to existing types
 
 What would happen if you could write extensions on protocols?
 
 Protocol extensions - you can extend a whole protocol to add method implementations, meaning that any types conforming to that protocol get those methods
 */

let guests = ["Mario", "Luigi", "Peach"]

// Doesn't really read naturally, so you can fix this with a really simple extension for Array
if !guests.isEmpty {
    print("Guest count: \(guests.count)")
}

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

/*
 We just added isNotEmpty to arrays, but what about sets and dictionaries?
 
 Array, Set and Dictionary all conform to a built-in protocol called Collection, through which they get functionality such as contains() sorted() reversed() and more
 
 ***Change 'Array' to 'Collection'
 
 With that 1 word change you can now use isNotEmpty on arrays, sets and dictionaries
 */

/*
 By extending the protocol you're adding functionality that would otherwise need to be done inside individual structs.
 
 This is really powerful and leads to a technique Apple calls 'protocol-oriented programming'
 1. You can list some required methods in a protocol
 2. Then add default implementations of those inside a protocol extension
 3. All conforming types then get to use those default implementations, or provide their own as needed.
 */

// For example
protocol Person {
    var name: String { get }
    func sayHello()
}

// This means all conforming types must add a sayHello() method, but you can also add a default implementation of that as an extension like this:
extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}*/


// Checkpoint 8
protocol Building {
    var numberOfRooms: Int { get }
    var cost: Int { get }
    var agentName: String { get }
    func salesSummary()
}

// Define an extension on the Building protocol to provide a default implementation for the salesSummary() method
extension Building {
    func salesSummary() {
        print("This building has \(numberOfRooms) rooms, costs $\(cost), and is being sold by \(agentName).")
    }
}

struct House: Building {
    let numberOfRooms: Int
    let cost: Int
    let agentName: String
}

struct Office: Building {
    let numberOfRooms: Int
    let cost: Int
    let agentName: String
}

let house = House(numberOfRooms: 4, cost: 500_000, agentName: "John Doe")
house.salesSummary()

let office = Office(numberOfRooms: 20, cost: 2_000_000, agentName: "James Dean")
office.salesSummary()
