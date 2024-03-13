//: [Previous](@previous)

import Foundation

//Day 3 - Arrays, dictionaries, sets and enums
//Arrays
var beatles = ["john", "paul", "george", "ringo"]
let numbers = [1, 2, 3, 4, 5]
var temperatures = [25.3, 28.3, 25.4]

print(beatles)
print(numbers)
print(temperatures)

print(beatles[2]) // prints the 3rd index in the array since indexing starts at 0

beatles.append("will") //.append() allows you to add an item to an array at the end
print(beatles)

var scores = [Int]() // allows you to declare an empty array by specifying the type of items it will contain
scores.append(100)
scores.append(90)
scores.append(80)
print(scores[1])
print(scores)

var albums = [String]()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")
print(albums)

print(albums.count) // prints the number of items in an array

albums.remove(at: 1) // removes the item at index 1
print(albums)

albums.removeAll() // removes all the items in the array
print(albums)

let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen")) //prints a boolean value if the item specified is in the array
print(bondMovies.sorted()) // prints the array sorted alphabetically
let bondMoviesReversed = bondMovies.reversed()
print(bondMoviesReversed)


//Dictionaries - allow us to decide where items should be stored
let employee = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]
// the left side are the keys to the dictionary
// the right side are the values to those keys

print(employee["name"]) // prints an optional because the existence of data is optional - it might be there or it might not

print(employee["name", default: "Unknown"]) // alllows you to provide a default value to print if the key doesn't exist , no longer returns as an optional

let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false
]

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2020: "Tokyo"
]

print(olympics[2012, default: "Unknown"])

var heights = [String: Int]() // create an empty dictionary using whatever types you want to store
heights["Yao Ming"] = 229
heights["Will Koonz"] = 60
print(heights)

// you can also use .count and .removeAll() and other useful functionalities


//Sets  - similar to arrays, except you can't add duplicate items and they don't store their items in a particular order. Removes duplicate values and won't remember the exact order that was used
let people = Set(["Person 1", "Person 2", "Person 3", "Person 4", "Person 5", "Person 6", "Person 7"])
print(people)

var people1 = Set<String>()
people1.insert("Denzel Washingtion") // we use .insert instead of .append because we aren't adding an item to the end of a set, because the set will store the items in whatever order it wants
people1.insert("Tom Cruise")
people1.insert("Nicolas Cage")

print(people1)


//Enums - short for enumeration - is a set of named values we can create and use in our code. Allows you to list up front the range of values it can have
enum fruits {
    case apple
    case orange
    case avocado
    case grape
    case strawberry
}

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday, saturday
}

var day = Weekday.monday
print(day)

day = .tuesday // once you assign a value from an enum to a variable you no longer have to use the enum name after first assignment
day = .wednesday

print(day)
