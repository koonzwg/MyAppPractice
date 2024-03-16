//: [Previous](@previous)

import Foundation

// Day 15 - Swift review

// Constants and variables


// Strings
//If you want double quotes inside your string, place a backslash before them:
let quote = "He tapped a sign saying \"Believe\" and walked away."

//If you want a string to span multiple lines, start and end with 3 double quotes:
let movie = """
A day in
the life of an
Apple engineer
"""


// Integers


// Decimals


// Booleans
// You can flip a boolean from true to false by calling its toggle() method
var isSaved = false
isSaved.toggle()


// Joining strings
let name = "Taylor"
// let age = 26
// let message = "I'm \(name) and I'm \(age) years old."
// print(message)


// Arrays


// Dictionaries
let employee = [
    "name": "Taylor",
    "job": "Singer"
]


// Sets
// Similar to arrays, except you can't add duplicate items, and they don't store items in a particular order
var numbers = Set([1,1,3,5,7])
print(numbers)


// Enums
// A set of named values we can create and use to make our code more efficient and safer
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

// You can now make instances of that enum, then assign other possible cases to it:
var day = Weekday.monday
day = .friday


// Type annotations
// You can try ot force a specific type for a new variable or constant by using type annotation like this:
var score: Double = 0
// Without the ': Double' part, Swift would infer that to be an Int, but we're overriding that and saying its a Double
let player: String = "Roy"
var luckyNumber: Int = 13
let pi: Double = 3.141
var isEnabled: Bool = true
// var albums: Array<String> = ["Red", "Fearless"]
// var user: Dictionary<String, String> = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation"])

// Arrays and dictionaries are so common that they have special syntax that is easier to write:
var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]

// Knowing the exact types of things is important for creating empty collections. For example, both of these create empty string arrays:
var teams: [String] = [String]()
var clues = [String]()

// Values of an enum have the same type as the enum itself, so we could write this:
enum UIStyle {
    case light, dark, system
}

var style: UIStyle = .light


// Conditions
// Use if, else, and else if statements to check a condition and run some code as appropriate:
/*&let age = 16

if age < 12 {
    print("You can't vote")
} else if age < 18 {
    print("You can vote soon.")
} else {
    print("You can vote now.")
}*/


// Switch statements
// Lets you check a value against multiple conditions using switch/case syntax

enum Weather {
    case sun, rain, wind
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("A nice day.")
case .rain:
    print("Pack an umbrella.")
default:
    print("Should be okay.")
}
// Switch statements must be exhaustive: all possible values must be handled so you can't miss one by accident


// The ternary conditional operator
// Allows you to check a condition and return one of 2 values: something if the condition is true, and something if it's false:
let age = 18
let canVote = age >= 18 ? "Yes" : "No"
print(canVote)


// Loops
// for loops run some code for every item in a collection, or in a custom range.
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works on \(os).")
}

// Can also loop over a range of numbers:
for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

// If you don't need the loop variable, use '_'
var lyric = "Haters gonna"
for _ in 1...5 {
    lyric += " hate"
}
print(lyric)


// While loops
// While loops execute their loop body until a condition is false
var count = 10

while count > 0 {
    print("\(count)...")
    count -= 1
}

print("Go!")

// You can use 'continue' to skip the current loop iteration and proceed to the following one:
let files = ["me.jpg", "work.txt", "sophie.jpg"]

for file in files {
    if file.hasSuffix(".jpg") == false {
        continue
    }
    print("Found picture: \(file)")
}
// alternatively, use 'break' to exit a loop and skip all remaining iterations


// Functions
// To create a new function, write 'func' followed by your functions name, then add parameters inside parentheses:
func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)

// To return data from a function, tell Swift what type it is, then use the return keyword to send it back
func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)
// if your function contains only a single line of code you can remove the return keyword


// Tuples - Returning multiple values from functions
// Tuples store a fixed number of values of specific types, which is a convenient way to return multiple values from a function
func getUser() -> (firstName: String, lastName: String) {
   (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")


// Customizing parameter labels
// If you don't want to pass a parameter's name when calling a function, place an underscore before it:
func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result = isUppercase(string)
// Alternative is to write a second name before the first: one to use externally, and one internally:
func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)
// In the above code, for is used externally and number is used internally


// Providing default values for parameters
// You can provide default parameter values by writing an equals after the type then providing a value
func greet(_ person: String, formal: Bool = false) {
    if formal {
        print("Welcome, \(person)!")
    } else {
        print("Hi, \(person)!")
    }
}
// Now you can call greet in 2 ways
greet("Tim", formal: true)
greet("Taylor")


// Handling errors in functions
// To handle errors in functions you need to tell Swift which errors can happen, write a function that can throw errors, then call it and handle any problems
// First, define the rrors that can occur:
enum PasswordError: Error {
    case short, obvious
}

// Second, write a function that can throw errors. This is done by placing throws into the functions type, then by using throw to trigger specific errors:
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 10 {
        return "OK"
    } else {
        return "Good"
    }
}

// Third, call the throwing function by starting a 'do' block, calling the function using 'try', then catching errors that occur:
let string = "12345"

do {
    let result = try checkPassword(string)
    print("Rating: \(result)")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}
// When it comes to catching errors, you must always have a catch block that can handle every kind of error


// Closures
// You can assign functionality directly to a constant or variable
let sayHello = {
    print("Hi there!")
}

sayHello()
// In the above code, sayHello is a closure
// Closure - A chunk of code we can pass around and call whenever we want. If you want the closure to accept parameters, they must be written inside the braces:
let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}
// the 'in' is ued to mark the end of the parameters and return type - everything after that is the body of the closure itself

let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

let onlyT = team.filter({ (name: String) -> Bool in
    return name.hasPrefix("T")
})
// Inside the closure we list the parameter filter() passes us, which is a string from the array. We also say that our closure returns a Boolean, then mark the start of the closure's code by using in - after that, everything else is normal function code


// Trailing closures and shorthand syntax
// Swift has a few tricks to make closures easier to read
let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

let onlyT = team.filter({ (name: String) -> Bool in
    return name.hasPrefix("T")
})

// you can remove return since there is only one line of code in the body
let onlyT = team.filter({ (name: String) -> Bool in
    name.hasPrefix("T")
})

// filter() must be given a function that accepts one item from its array, and returns true if it should be in the returned array.
// Because the function we pass in must behave like that, we don't need to specify the types in our closure.
let onlyT = team.filter({ name in
    name.hasPrefix("T")
})

// you can go further using special syntax called trailing closure syntax, which looks like this:
let onlyT = team.filter { name in
    name.hasPrefix("T")
}

// finally, Swift can provide short parameter names for us so we don't even write 'name in' anymore, and instead rely on a specially named value provided for us: $0:
let onlyT = team.filter {
    $0.hasPrefix("T")
}


// Structs
// Structs let you create your own custom data types, complete with their own properties and methods
struct Album {
    let title: String
    let artist: String
    var isReleased = true

    func printSummary() {
        print("\(title) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift")
print(red.title)
red.printSummary()

// When you create instances of structs we do so using an initializer - Swift lets you treat your struct like a function, passing in parameters for each of its properties.
// It silenlty generates this memberwise initializer based on the struct's properties

// If you want to have a struct's method change one of its properties, mark it as mutating:
mutating func removeFromSale() {
isReleased = false
}


// Computed properties
// Computed property - calculates its value every time it's accessed. For example, you could write an Employee struct that tracks how many days of vacation remained for that employee:
struct Employee {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0

    var vacationRemaining: Int {
        vacationAllocated - vacationTaken
    }
}
// To be able to write to vacationremaining we need to provide both a getter and a setter
var vacationRemaining: Int {
    get {
        vacationAllocated - vacationTaken
    }
    set {
        vacationAllocated = vacationTaken + newValue
    }
}
// 'newValue' is provided by Swift, and stores whatever value the user was assigning to the property


// Property observers
// Property observers - pieces of code that run when properties change:
// didSet runs when the property just changed
// willSet runs before the property chagned

// We could demonstrate didSet by making a Game struct print a message when the score changes:
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


// Custom initializers
// Custom initializers - special functions that prepare a new struct instance to be used, ensuring all properties have an initial value

// Swift generates one based on the structs properties, but you can create your own:
struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}
// Initializers don't have 'func' before them and don't explicitly return a value


// Access control
/*
 Swift has several options for access control inside structs, but 4 are the most common:
 - Use 'private' for "don't let anything outside the struct use this."
 - Use 'private(set) for "anything outside the struct can read this, but don't let them change it."
 - Use 'fileprivate' for "don't let anything outside the current file use this."
 - Use 'public' for "let anyone, anywhere use this."
 */
struct BankAccount {
    private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}
// Because we used private(set), reading funds from outside the struct is fine but writing isn't possible


// Static properties and methods
// Swift supports static properties and methods, allowing you to add a property or method directly to the struct itself rather than to one instance of the struct:
struct AppData {
    static let version = "1.3 beta 2"
    static let settings = "settings.json"
}
// Using this approach, everywhere we need to check or display something like tha app's version number we can read AppData.version


// Classes
// Classes - allow you to create custom data types, and are different from structs in 5 ways

// 1. You can create classes by inheriting functionality from other classes:
class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

class Developer: Employee {
    func work() {
        print("I'm coding for \(hours) hours.")
    }
}

let novall = Developer(hours: 8)
novall.work()
novall.printSummary()
// If a child class wants to change a method from a parent class, it must use override:
override func printSummary() {
    print("I spend \(hours) hours a day searching Stack Overflow.")
}

/* 2. Initializers are more tricky with classes. Theres a lot of complexity here, but there are 3 key points:
 - Swift won't generate a memberwise initializer for classes.
 - If a child class has custom initializers, it must always call the parent's initializer after it has finished setting up its own properties
 - If a subclass doesn't have any initializers, it automatically inherits the initializers of its parent class
 */

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}
// 'super' allows you to call up to methods that belong to the parent class, such as its initializer

// 3. All copies of a class instance share their data, meaning that changes you make to one will automatically change other copies.
class Singer {
    var name = "Adele"
}

var singer1 = Singer()
var singer2 = singer1
singer2.name = "Justin"
print(singer1.name)
print(singer2.name)
// Will print "Justin" for both - even though we only changed one of them, the other is also changed. In comparison, struct copies don't share their data

// 4. Classes can have a deinitializer that gets called when the last reference to an object is destroyed
class User {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}

// 5. Classes let us change variable properties even when the class itself is constant
class User {
    var name = "Paul"
}

let user = User()
user.name = "Taylor"
print(user.name)
// classes don't need the 'mutating' keyword with methods that change their data


// Protocols
// Protocols - define functionality we expect a data type to support, and Swift ensures our code follows those rules
protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}
// That lists the required methods for this protocol to work, but doesn't contain any code - we're specifying only method names, parameters and return types

// Once you have a protocol you can make data types conform to it by implementing the required functionality. For example, we could make a Car struct that conforms to Vehicle
struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
}
// All the methods listed in Vehicle must exist exactly in Car, with the same name, parameters, and return types
// Now you can write a function that accepts any kind of type that conforms to Vehicle, because swift knows it implements both estimateTime() and travel():
func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too slow!")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car()
commute(distance: 100, using: car)

// Protocols can also require properties, so we could require properties for how many seats vehicles have and how many passengers they currently have:
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}
/*
 That adds 2 properties:
 1. One marked with get that might be a constant or computed property
 2. One marked with 'get set' that might be a variable or a computed property with a getter and setter
 */

// Now all conforming types must add implementations of thos 2 properties, like this for Car:
let name = "Car"
var currentPassengers = 1
// You can conform to as many protocols as you need, just by listing them separated with a comma


// Extensions
// Extensions - Allow you to add functionality to any type. For example, Swifts strings have a method for trimming whitespace and new lines, but its quite long so we could turn it into an extension:
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmed()
// If you want to change a value directly rather than returning a new value, mark your method as mutating like this:
extension String {
    mutating func trim() {
        self = self.trimmed()
    }
}

quote.trim()

// Extensions can also add computed properties to types, like this one:
extension String {
    var lines: [String] {
        self.components(separatedBy: .newLines)
    }
}
// The components(separatedBy:) method splits a string into an array of strings using a boundary of our choosing, which in this case is new lines
// You can now use that property with all strings:
let lyrics = """
But I keep cruising
Can't stop, won't stop
"""
print(lyrics.lines.count)


// Protocol extensions
// Protocol extensions - Extend a whle protocol to add computed properties and method implementations, so any types conforming to that protocol get them
// Array, Dictionary, and Set all conform to the Collection protocol, so you can add a computed property to all 3 of them like this:
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}
// This approach means you can list required methods in a protocol, then add default implementations of those inside a protocol extension. All conforming types then get to use those default implementations, or provide their own as needed


// Optionals
// Optionals represent the absence of data - for example they distinguish between an integer having the value 0 and having no value at all
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]
// This attempts to read the value attached to the key "Peach", which doesn't exist, so this can't be a regular string. Swifts solution is called optionals, which means data that might be present or might not

// An optional string might have a string waiting inside for us, or there might be nothing at all - a special value called nil, that means "no value"
// Any kind of data can be optional, including Int, Double, and Bool, as well as instance of Enums, Structs, and Classes

// Swift won't let you use optional data directly, because it might be empty. That means we need to unwrap the optional to use it - we need to look inside to see if there's a value, and, if there is, take it out and use it

// Swift gives us several ways of unwrapping optionals, but the one you'll see most looks like this:
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}
// That reads the optional value from the dictionary and if it has a string inside it gets unwrapped - the string insidge gets placed into the 'marioOpposite' constant and isn't optional any more.
// Because we were able to unwrap the optional, the condition is a success so the print() code is run


// Guard - Unwrapping optionals with guard
// Swift has a 2nd way of unwrapping optionals, called 'guard let' which is very similar to 'if let' except it flips things around:
// if let - runs the code inside its braces if the optional had a value
// guard let - runs the code if the optional didn't have a value

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    print("\(number) x \(number) is \(number * number)")
}
// If you use guard to cehck a functions inputs are valid, Swift requires you to use 'return' if the check fails. However, if the optional you're unwrapping has a value inside, you can use it after the 'guard' code finishes
// You can use guard with any condition, including ones that don't unwrap optionals


// Nil coalescing
// Swift has a 3rd way of unwrapping optionals, called the nil coalescing operator - it unwraps an optional and provides a default value if the optional was empty:
let tvShows = ["archer", "babylon 5", "ted lasso"]
let favorite = tvShows.randomElement() ?? "None"
// The nil coalescing operator is useful in many places optionals are created. For example, creating an integer from a string returns an optional Int? because the conversion might have failed. Here we can use nil coalescing to provide a default value:
let input = ""
let number = Int(input) ?? 0
print(number)


// Optional chaining
// Optional chaining - reads optionals inside optionals, like this:
let names = ["arya", "bran", "robb", "sansa"]
let chosen = names.randomElement()?.uppercased()
print("Next in line: \(chosen ?? "No one")")
// Optional chaining is the question mark followed by more code. It allows you to say "if the optional has a value inside, unwrap it then..." and add more code
// In the case above, you're saying "if we got a random element from the array, uppercase it"


// Optional try?
// When calling a function that might throw errors, we can use try? to convert its result into an optional containing a value on success, or nil otherwise
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}
