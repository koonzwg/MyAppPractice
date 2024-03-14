//: [Previous](@previous)

import Foundation

//Day 8 - Default values, throwing functions, checkpoint 4
// Default values - How to provide default values for parameters
/*func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)


//How to handle errors in functions
/*
 Swift makes us handle errors - or at least acknowledge when they might happen. This takes 3 steps:
 1. Telling Swift about the possible errors that can happen.
 2. Writing a function that can flag up errors if they happen.
 3. Calling that function, and handling any errors that might happen
 */
enum PasswordError: Error {
    case short, obvious
}

// When an error is triggered in swift, it is called "Thrown"
// The "throws" keyword is used to indicate that a function can potentially throw an error
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

// 3 steps to running the function and handling any errors that might happen

 1. Starting a block of work that might throw errors, using do
 2. Calling one or more throwing functions, using try
 3. Handling any thrown errors using catch
 */

/*let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch PasswordError.short {
    print("Please use a longer password.")
} catch PasswordError.obvious {
    print("I have the same combination in my luggage!")
} catch {
    print("There was an error.")
}*/
// try keyword must be called in front of functions that may return an error
// When you use try , you need to be inside a do block, and make sure you have one or more catch blocks able to handle any errors


// Checkpoint 4
// Write a function that accepts an integer from 1 through 10,000 and returns the integer square root of that number

// Create an enum to define the 2 potential error cases
enum SquareRootError: Error {
    case outOfBounds, noRoot
}

// Create a function that takes an integer as input and returns an integer. It is marked with throws to indicate it can throw an error
func integerSquareRoot(_ number: Int) throws -> Int {
    //Check if the input number is within the valid range of 1 to 10,000. If it's not, we throw the outOfBounds error
    if number < 1 || number > 10_000 {
        throw SquareRootError.outOfBounds
    }
    
    //if number equals 1 then we return 1 since the square root of 1 is 1
    if number == 1 {
        return 1
    }
    
    //Initialize 2 variables: lowerBound and upperBound. lowerBound represents the smallest possible value for square root and uppwerBound represents the largest possible value.
    var lowerBound = 1
    var upperBound = number
    
    // Enter a while loop that continues as long as lowerBound is less than or equal to upperBound. This loop uses the binary search algorithm to find the square root
    while lowerBound <= upperBound {
        //Calculate the middle value as the average of lowerBound and upperBound. Also calculate the square of middle.
        let middle = (lowerBound + upperBound) / 2
        let square = middle * middle
        
        //Compare the square with the input number
        if square == number {
            return middle
        } else if square < number {
            lowerBound = middle + 1
        } else {
            upperBound = middle - 1
        }
    }
    
    throw SquareRootError.noRoot
}

do {
    let result = try integerSquareRoot(25)
    print(result)
} catch SquareRootError.outOfBounds {
    print("Error: The number is out of bounds (1...10000).")
} catch SquareRootError.noRoot {
    print("Error: No integer square root found for the given number.")
} catch {
    print("An unexpected error occured.")
}

    
