import UIKit

//Day 1 - Variables, constants, strings and numbers
//Variables and constants
var greeting2 = "Hello, playground"

var variable = "This is a variable"
variable = "This is now a modified variable"

let constant = "This is a constant"
//constant = "This is not allowed"


//Strings
var aString = "This is a string"
var multiLineString = """
This is a multi
line string which
is used rarely, but must
be typed in this specific manner
"""

print(aString.count) //This prints the number of characters in the string, including the spaces

let stringLength = aString.count
print(stringLength) //This prints the number of characters in the "aString" variable, but stored within a constant

print(aString.uppercased()) //This prints the string in all uppercase

print(aString.hasPrefix("This")) //prints true (case sensitive)
print(aString.hasSuffix("String")) //prints false (case sensitive)


//Int - Store whole numbers "Integers"
var currentScore = 10
let finalScore = 90

var reallyBigNumber = 100_000_000_000_000

print(reallyBigNumber)

//You can also create integers from other integers using arithmetic operators
currentScore -= 2
currentScore += 5
currentScore *= 3
currentScore *= currentScore
currentScore /= 2
print(currentScore)

print(finalScore % 10) // prints the remainder
print(finalScore.isMultiple(of: 10)) //prints true


//Double - Store decimal numbers "floating-point numbers"
let number = 0.1 + 0.2
print(number)

/*var a: Int = 1
var b: Double = 2.0
var c = a + b
// print(c) - this will not work because of type safety.
c = a + Int(b)
print(c)*/



