//: [Previous](@previous)

import Foundation

//Day 6 - Loops, Summary and Checkpoint 3
// Loops - How to use a loop to repeat work
let platforms = ["IOS, macOS, tvOS, watchOS"]
for os in platforms {
    print("Swift works great on \(os).")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

for i in 1...12 {
    print("The \(i) times table:")
    
    for j in 1...12 {
        print(" \(j) x \(i) is \(j * i)")
    }
    print()
}

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}


// While loop - How to use a while loop to repeat work
var countdown = 10

while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}

print("Blast off!")

//create an integer to store our roll
var roll = 0
//carry on looping until we reach 20
while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}
//if we're here it means the loop ended - we get a 20!
print("Critical hit")


// Break & Continue - How to skip loop items with break and continue
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]
//loops over the array, checks if the item has the suffix .jpg, prints those items
for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    print("Found picture: \(filename)")
}

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}
print(multiples)



/*Checkpoint 3
1. loop through 1 to 100
2. If it's a multiple of 3, print "Fizz"
3. If it's a multiple of 5, print "Buzz"
4. If it's a multiple of 3 and 5, print "FizzBuzz"
5. Otherwise, just print the number*/

for i in 1...100 {
    if i.isMultiple(of: 3) && i.isMultiple(of: 5) {
        print("FizzBuzz")
    } else if i.isMultiple(of: 3) {
        print("Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(i)
    }
}
