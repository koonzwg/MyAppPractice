//: [Previous](@previous)

import Foundation

//Day 7 - Functions, parameters, and return values
/*func showWelcome() {
    print("Welcome to my app!")
    print("By default this prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}
showWelcome()

// number: Int is a parameter, parameters must be specified when you call the function as a reminder of what those parameters do
func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}
//5 and 20 are the arguements that are passed to the parameters when you call a function
printTimesTables(number: 5, end: 20)

//parameter = placeholder, arguement = actual value = Parameter/Placeholder, Arguement/Actual value


//Return - How to return values from functions
//If you want to return your own value from a function, you need to do 2 things:
//1. Write an arrow then a data type before your functions opening brace, which tells swift what kind of data will get sent back
//2. Use the return keyword to send back your data
func rollDice() -> Int {
    return Int.random(in: 1...6)
}
let result = rollDice()
print(result)

// do 2 strings contain the same letters, regardless of their order?
// should accept 2 string parameters and return true if their letters are the same

func sameString(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}
sameString(string1: "abc", string2: "bca")

//If your function only contains one line of code, you don't need a return keyword
func rollDice() -> Int {
    Int.random(in: 1...6)
}
print(rollDice())

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}
let c = pythagoras(a: 4, b: 2)
print(c)


//Tuples - How to return multiple values from a function
func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user = getUser()
print("Name: \(user.firstName) \(user.lastName)")
//Swift knows ahead of time what values are available in a tuple, compared to a dictionary which does not
//Access the values using . syntax ex. user.firstName = no typos or room for error
//Uses key/value pairs
//Dictionries might contain hundreds of other values alongside "firstName" but a tuple can't, you must list all the values it will contain
*/


// How to customize parameter labels
func rollDice(sides: Int, count: Int) -> [Int] {
    //Starts with an empty array
    var rolls = [Int]()
    
    //Roll as many dice as needed
    for _ in 1...count {
        //Add each result to our array
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }
    
    //Send back all the rolls
    return rolls
    
}

let rolls = rollDice(sides: 6, count: 4)
print(rolls)

// We write for number: Int - the external name is for, the internal name is number, and its of type int
// When we call the function we use the external name for the parameter: printTimesTables(for: 5)
// inside the function we use the internal name for the parameter: print("\(i) x \(number) is \(i * number)")
func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(for: 5)
//Swift gives you 2 important ways to control parameter names:
//1. _ for the external parameter name so that it doesn't get used
//2. Add a second name there so that you have both an external parameter name and an internal parameter name
