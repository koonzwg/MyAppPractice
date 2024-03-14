//: [Previous](@previous)

import Foundation

//Day 5 - If, switch, and the ternary operator
// if statements - How to check if a condition is true or false
let score = 85

if score > 80 {
    print("What a great score!")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going we don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote")
}

var numbers = [1, 2, 3]
numbers.append(4)
//print(numbers)
if numbers.count > 3 {
    numbers.remove(at: 0)
}
print(numbers)

var username = ""
if username.isEmpty {
    username = "anonymous"
    print(username)
}


// if else statements - How to check multiple conditions
let age = 16
if age >= 18 {
    print("you can vote")
} else {
    print("sorry you can't vote")
}

let a = false
let b = true
if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}

let temp = 25 // this allows you to check multiple conditions at once
if temp > 20 {
    if temp < 30 {
        print("It's the perfect weather")
    }
}

if temp > 20 && temp < 30 {
    print("it's a nice day.")
}

let userAge = 14
let hasParentalConsent = true

if userAge >= 18 || hasParentalConsent {
    print("you can buy the game")
}

enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.bicycle

if transport == .airplane || transport == .helicopter {
    print("Lets fly")
} else if transport == .bicycle {
    print("I hope there's a bike path...")
} else if transport == .car {
    print("Time to get stuck in traffic.")
} else {
    print("I'm going to hire a scooter now!")
}


// Switch statements - How to use switch statements to check multiple conditions
enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}


// Ternary operator - How to use the ternary conditional operator for quick tests
let age = 18
let canVote = age >= 18 ? "Yes" : "No" // "WTF" = what - what is our condition, true - what to do when the condition is true, false - what to do when the condition is false
print(canVote)

enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)
