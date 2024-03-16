//: [Previous](@previous)

import Foundation

// Day 14 - Optionals, nil coalescing, and checkpoint 9
// Optionals - How to handle missing data with Optionals

// Optionals are trying to answer the question "What if our variable doesn't have any sort of value at all?"

/*let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]
print(peachOpposite)

// "Peach" doesn't exist. Swifts solution is called:
// Optionals - which means data that might be present or might not.
// Primarily represented by placing a question mark after your data type, so in this case peachOpposite would be a String? rather than a String

// Swift gives you 2 ways to unwrap an optioonal to see what's inside of it

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

/*
 This if let syntax is very common in Swift, and combines creating a condition (if) with creating a constant (let). Together it does 3 things:
 1. It reads the optional value from the dictionary
 2. If the optional has a string inside, it gets unwrapped - that means the string inside gets placed into the marioOpposite constant
 3. The condition has succeeded - we were able to unwrap the optional - so the condition's body is run
 
 The conditions body will only be run if the optional had a value inside.
 If you want to add an else block you can - it's just a normal condition, so this kind of code is fine:
 
var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

// Every data type can be optional if needed, including an Array and Dictionary

// Swift will refuse to build the following code because the optional integer needs to be unwrapped - you can't use an optional value where a non-optional is needed, because if there were no value inside you'd hit a problem
func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
print(square(number: number))

// First, unwrap it like this

if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}

// When unwrapping optionals, it's very common to unwrap them into a constant of the same name.

// Creating a second constant of the same name, available only inside the conditions body. This is called shadowing, and its mainly used with optional unwraps like you can see above
if let number = number {
    print(square(number: number))
}


// Guard - How to unwrap optionals with guard

// if let is the most common way of using optionals and unwrapping them, but there is a second way that does much the same thing, and it's almost as common
// guard let

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    print("\(number) x \(number) is \(number * number)")
}

// Life 'if let' 'guard let' checks whether there is a value inside an optional, and if there is it will retrieve the value and place it into a constant of your choosing
// The way it does this flips things around:

var myVar: Int? = 3

if let unwrapped = myVar {
    print("Run if myVar has a value inside")
}

guard let unwrapped = myVar else {
    print("Run if myVar doesn't have a value inside")
}

/*
 if let - runs the code inside its braces if the optional had a value
 guard let - runs the code inside its braces if the optional didn't have a value
 
 This explains the use of 'else' in the code: "check that we can unwrap the optional, but if we can't then..."
 
 guard provides the ability to check whether your program state is what you expect, and if it isn't to bail out - to exit from the current function, for example.
 
 This is called an early return: we check that all a functions inputs are valid right as the function starts, and if any aren't valid we get to run some code then exit straight away. If all our checks pass, our function can run exactly as intended
 */

/*
 guard is designed exactly for this style of programming, and in fact does 2 things to help:
 1. If you use guard to check a functions inputs are valid, Swift will always require you to use return if the check fails
 2. If the check passes and the optional you're unwrapping has a value inside, you can use it after the guard code finishes
 */

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        
        // 1: We *must* exit the function here
        return
    }
    
    // 2: 'number' is still available outside of 'guard'
    print("\(number) x \(number) is \(number * number)")
}

/*
 So, use:
 1. if let - if you want to unwrap optionals so you can process them somehow
 2. guard let - if you want to ensure optionals have something inside them and exit otherwise
 */


// Nil Coalescing - How to unwrap optionals with nil coalescing

// Swift has a 3rd way of unwrapping optionals - nil coalescing: allows you to unwrap an optional and provide a default value if the optional was empty

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

// reads a non existent key in the dictionary, which means 'new' will be an optional string set to nil
let new = captains["Serenity"]

// with the nil coalescing operator, you can provide a default value for any optional, like this:
let new = captains["Serenity"] ?? "N/A"

// This means no matter what the optional contains - a value or nil - the end result is that new will be a real string, not an optional one. Might be a string from inside the captains value, or it might be "N/A"

// Can't we specify a default value when reading from the dictionary?
let new = captains["Serenity", default: "N/A"]

// nil coalescing operator works with any optionals
let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]

// randomElement() method on arrays returns one random item from the array, but it returns an optional because you might be calling it on an empty array. So, you use nil coalescing to provide a default
let favorite = tvShows.randomElement() ?? "None"

// Or perhaps you have a struct with an optional property, and want to provide a sensible default for when it's missing:
struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)


// Optional chaining - How to handle multiple optionals using optional chaining

// Optional chaining - simplified syntax for reading optionals inside optionals

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

// Optional chaining allows you to say: "if the optional has a value inside, unwrap it then..."
// In the case above, you're saying: "If we managed to get a random element from the array, then uppercase it"

// The magic of optional chaining is that it silently does nothing if the optional was empty - it will just send back the same optional you had before, still empty

/*
 Scenario: You want to place books in alphabetical order based on their author names. If you break this down, then:
 - You have an optional instance of a Book struct - wwe might have a book to sort, or you might not
 - The book might have an author, or might be anonymous
 - If it does have an author string present, it might be an empty string or have text, so you can't always rely on the first letter being there
 - If the first letter is there, make sure it's uppercase so that authors with lowercase names such as bell hooks are sorted correctly
 */

struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)*/

// The above reads: "If we have a book, and the book has an author, and the author has a first letter, then uppercase it and send it back, otherwise, send back A


// How to handle function failure with optionals

// When calling a function that might throw errors, you either call it using 'try' and handle errors appropriately, or if you're certain the function will not fail you use try! and accept that if you were wrong the code will crash

/*
 There is an alternative:
 If all we care about is whether the function succeeded or failed, you can use an optional try to have the function return an optional value
 If the function ran without throwing any errors then the optional will contain the return value
 If any error was thrown the function will return nil
 This means we don't get to know exactly what error was thrown, bot often that's fine - we might just care if the function worked or not
 */

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}
*/
/*
 try? is mainly used in 3 places:
 1. In combination with guard let to exit the current function if the try? call returns nil
 2. In combination with nil coalescing to attempt something or provide a default value on failure
 3. When calling any throwing function without a return value, when you genuinely don't care if it succeeded or not - maybe you're writing to a log file or sending analytics to a server, for example.
 */


// Checkpoint 9
func randomNumber(from array: [Int]?) -> Int {
    array?.randomElement() ?? Int.random(in: 1...100)
}

let numbers = [1, 2, 3, 4, 5]
let randomNum1 = randomNumber(from: numbers)
print(randomNum1)

let emptyArray: [Int] = []
let randomNum2 = randomNumber(from: emptyArray)
print(randomNum2)

let missingArray: [Int]? = nil
let randomNum3 = randomNumber(from: missingArray)
print(randomNum3)
