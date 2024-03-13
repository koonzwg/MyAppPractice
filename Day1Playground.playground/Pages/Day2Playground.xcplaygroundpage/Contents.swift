[Previous](@previous)

import Foundation

//Day 2 - Booleans, string interpolation, and checkpoint 1
//Booleans - true or false values
let isTheSkyBlue = true
let isTheSkyRed = false
let isMultiple = 120.isMultiple(of: 3)
print(isMultiple)

var notTrue = !true
print(notTrue) //prints the opposite
notTrue = !notTrue
print(notTrue) //reverses it again since we changed the variable

var gameOver = false
print(gameOver)

gameOver.toggle() //a .toggle() flips the value to the opposite
print(gameOver)


// String interpolation
let firstPart = "Hello, "
let secondPart = "World!"
let greeting = firstPart + secondPart
print(greeting) //prints "Hello, World!"

let myName = "William"
let myLastName = "Koonz"
let myAge = 24
let message = "Hello, my name is \(myName) \(myLastName) and I'm \(myAge) years old."
print(message)

print("5 x 5 is \(5 * 5)") //prints 5 x 5 is 25


//Checkpoint 1 - Celcius to Fahrenheit converter
/*Goal: Write a playground that:
 1. Creates a constant holding any temperature in Celsius
 2. Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32
 3. Prints the result for the user, showing both the Celsius and Fahrenheit values
 */
let tempC = 50
let tempF = (tempC * 9) / 5 + 32
print("The current temperature in Celcius is: \(tempC) and the current temperature in Fahrenheit is: \(tempF)")
