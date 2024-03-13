//: [Previous](@previous)

import Foundation

//Day 4 - Type Annotations and checkpoint 2
//Type annotations
let surname = "Lasso"
var score = 0
//Both of these use type inference: swift infers the data type because it is what we assigned to it

let surname1: String = "William" // Type annotations let us be explicit about what data types we want
var score1: Double = 0


/*Checkpoint 2
1. create an array of strings
2. write some code that prints the number of items in the array
3. write some code that prints the number of unique items in the array */

var names = [String]()

names.append("William")
names.append("John")
names.append("Jeff")
names.append("Alfred")
names.append("Austin")
names.append("William")
names.append("Jeffrey")
names.append("Janice")

print(names.count)

let uniqueNames = Set(names)

print(uniqueNames.count)


