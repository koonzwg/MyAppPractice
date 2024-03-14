//: [Previous](@previous)

import Foundation

//Day 9 - Closures, passing functions into functions, and checkpoint 5
// Closures - How to create and use closures

// Closures are a bit like anonymous funcitons - functions we can create and assign directly to a variable, or pass into othe functions to customize how they work.
// Passing one function into another as a parameter

/*func greetUser() {
    print("Hi there")
}

greetUser()

//When you're copying a function, you don't write the parentheses after it - it's var greetCopy = greetUser
// If you put the parentheses there you are calling the function and assigning its return value back to something else
var greetCopy = greetUser
greetCopy()

// assigning the functionality directly to a constant or a variable
// Swift calls this a "Closure expression" - we just created a chunk of code we can pass around and call whenever we want
// Effectively a function that takes no parameters and doesn't return a value
let sayHello = {
    print("Hi there 2")
}

sayHello()

// If you want the closure to accept parameters, they need to be written in a special way
// the "in" keyword comes directly after the parameters and return type of the closure
// in is used to mark the end of the parameters and return type - everything after that is the body of the closure itself.
let sayHelloAgain = { (name: String) -> String in
    "Hi \(name)!"
}

var greetCopy: () -> Void = greetUser*/
/*
 1. The parentheses marks a function that takes no parameters
 2. The arrow means just what it means when creating a function: we're about to declare the return type for the function
 3. Void means "nothing" - this function returns nothing. Sometimes you might see this written as (), but we usually avoid that because it can be confused witht the empty parameter list
 

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

// External parameter names only matter when we're calling a function directly, not when we create a closure or when we take a copy of the function first.

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
/*let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}
*/
/*let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)*/


/*
 Here's whats happening below:
 1. We're calling sorted() function as before
 2. Rather than passing in a function, we're passing in a closure - everything from the opening brace after by: down to the closing brace on the last line is part of the closure
 3. Directly inside the closure we list the 2 parameters sorted() will pass us, which are 2 strings. We also say that our closure will return a boolean, then mark the start of the closure's code by using in
 4. Everything else is just normal function code
 */
/*let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
})
print(captainFirstTeam)*/


//How to use trailing closures and shorthand syntax
// sorted() can accept any kind of function to do custom sorting, with one rule: That function must accept 2 items from the array in question (That's 2 strings here) and return a boolean set to true if the first string should be sorted before the second
// The function MUST behave like that, if it returned nothing, or only accepted 1 string, then swift would refuse to build your code
// We don't need to specify the types of our 2 parameters because they must be strings, and we don't need to specify a return type because it must be a boolean. So we can rewrite the code to this
/*let captainFirstTeam = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}*/

//When one function accepts another as its parameter, like sorted() does, Swift allows special syntax called trailing closure syntax
// Rather than passing the closure in as a parameter, we just go ahead and start the closure directly and in doing so remove (by: from the start

//Theres one last way swift can make closures less cluttered: Swift can automatically provide parameter names for us, using shorthand syntax

let captainFirstTeam = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    return $0 < $1
}
print(captainFirstTeam)

let reverseTeam = team.sorted { $0 > $1 }
print(reverseTeam)

// Use shorthand syntax unless any of the following are true:
/*
 1. The closure's code is long
 2. $0 and friends are used more than once each
 3. You get 3 or more parameters (e.g. $2, $3, etc)
 */

// .filter() function lets us run some code on every item in an array and will send back a new array containing every item that returns true for the function.
// For example, we could find all players whos names begin with T
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

// .map() function lets you transform every item in an array using some code of your choosing and sends back a new array of all the transformed items
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)
*/
 
/*
 You will use closures a lot with SwiftUI:
 1. When you create a list of data on the screen, SwiftUI will ask you to provide a function that accepts one item from the list and converts it something it can display on-screen
 2. When you create a button, SwiftUI will ask you to provide one function to execute when the button is pressed, and another to generate the contents of the button - a picture, or some text, and so on
 3. Even just putting stacking pieces of text vertically is done using a closure
 */


// How to accept functions as parameters
func greetUser() {
    print("Hi there!")
}

greetUser()

var greetCopy: () -> Void = greetUser
greetCopy()

// Function that generates an array of integers by repeating a function a certain number of times:
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}

/*
 Let's break it down
 1. The function is called makeArray(). It takes 2 parameters, one of which is the number of integers we want, and also returns an array of integers.
 2. The second parameter is a function. This accepts no parameters itself, but will return one integer every time it's called.
 3. Inside makeArray() we create a new empty array of integers, then loop as many times as requested.
 4. Each time the loop goes around we call the generator function that was passed in as a parameter. This will return one new integer, so we put that into the numbers array.
 5. Finally the finished array is returned
 */

//The body of the makeArray() is mostly straightforward: repeatedly call a function to generate an integer, adding each value to an array, then send it all back.
// The complex part is the very first line

// func makeArray(size: Int, using generator: () -> Int) -> [Int] {

/*
 1. We're creating a new function
 2. The function is called makeArray()
 3. The first parameter is an integer called size.
 4. The second parameter is a function called generator, which itself accepts no parameters and returns an integer
 5. The whole thing - makeArray() - returns an array of integers
 */

//The result is that we can now make arbitrary-sized integer arrays, passing in a function that should be used to generate each number:
let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)

// This functionality works with dedicated functions too, so we could write something like this:
func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

//You can make your functions accept multiple function parameters if you want, in which case you can specify multiple trailing closures. The syntax is very common in SwiftUI, so it's important to at least show you a taste of it here.

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("about to start first work")
    first()
    print("about to start second work")
    second()
    print("about to start third work")
    third()
    print("Done!")
}


// Checkpoint 5 -
/*
 With closures under my belt, its time to try a coding challenge using them.
 
 Use sorted(), filter(), map() together in a chain - call one, then the other, then the other back to back without using temporary variables
 
 Your input is the constant "luckyNumbers"
 */

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

/*
 1. Filter out any numbers that are even
 2. Sort the array in ascending order
 3. Map them to strings in the format "7 is a lucky number"
 4. Print the resulting array, one item per line
 
 The output should be as follows:
 7 is a lucky number
 15 is a lucky number
 21 is a lucky number
 31 is a lucky number
 33 is a lucky number
 49 is a lucky number
 */

let result = luckyNumbers
    .filter { !$0.isMultiple(of:2) } // Filters out any numbers in the array that are NOT even using the ! operator to negate the result of isMultiple(of:2)
    .sorted() // sorts the array in ascending order - default order for sorting() is ascending so no need for a closure
    .map { "\($0) is a lucky number"} // maps each number in the sorted array to a string in the format "7 is a lucky number". $0 represents the current number being processed in the closure

result.forEach { print($0) } // forEach is a method that allows you to iterate over each elemnt in an array and perform a specific action on each element. Takes a closure as an aguement and that closure is executed for each element in the array

