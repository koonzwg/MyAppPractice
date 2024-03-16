//: [Previous](@previous)

import Foundation

// Day 12 - Classes, inheritance, checkpoint 7
// Classes - How to create your own classes

/*
 Classes are very similar to structs. They have the following in common:
 1. You get to create and name them
 2. You can add properties and methods, including property observers and access control
 3. You can create custom initializers to configure new instances however you want
 However, they are different from structs in 5 key places:
 1. You can make one class build upon functionality in another class, gaining all its properties and methods as a starting point. If you want to selectively override some methods, you can do that too
 2. Because of that first point, Swift won't automatically generate memberwise initializer for classes. This means you either need to write your own initializer, or assign default values to all your properties.
 3. When you copy an instance of a class, both copies share the same data - if you change one copy, the other one also changes
 4. When the final copy of a class instance is destroyed, Swift can optionally run a special function called a deinitializer
 5. Even if you make a class constant, you can still change its properties as long as they are variables
 

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

// Structs are important, but so are classes - you will need both when using SwiftUI


// Inheritance - How to make one class inherit from another

// Swift allows you to create classes by basing them on existing classes, which is a process known as inheritance
// When 1 class inhertis functionality from another class (its "parent" or "super" class), Swift will give the new class access (the "child class" or "subclass") to the properties and methods from that parent class, allowing you to make small additions or changes to customize the way the new class behaves

// To make one class inherit from another, write a colon after the child class's name, then add the parent class's name.
class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

/*class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
}*/

class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

// As well as sharing properties, you can also share methods, which can then be called from the child classes.

let novall = Developer(hours: 8)
novall.printSummary()

// Because Developer inherits from Employee, you can immediately start calling printSummary() on instances of Developer

/*
This is where Swift enforces a simple rule: if a child class wants to change a method from a parent class, you must use override in the child class's version. This does 2 things:
1. If you attempt to change a method without using override, Swift will refuse to build your code. This stops you accidentally overriding a method.
2. If you use override but your method doesn't actually override something from the parent class, Swift will refuse to build your code because you probably made a mistake
 */

// So if you wanted developer to have a unique printSummary() method, you would add this to the Developer class

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

// Swift is smart about how method overrides work: If your parent class has a work() method that takes no parameters, but the child class has a work() method that accepts a string to designate where the work is being done, that does not require override because you aren't replacing the parent method
// If you know for sure that your class should not support inheritance, you can mark it as final


// Initializers - How to add initializers for classes

// If a child class has any custom initializers, it must always call the parents initializer after it has finished setting up its own properties, if it has any.
// Swift will never generate a memberwise initializer for you, so you either need to write your own initializer or provide default values for all the properties of the class

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

// Swift wants you to provide Car with an initializer that includes both isElectric and isConvertible
class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}
// super is another one of those values that Swift automatically provides for us, similar to self: it allows you to call up to methods that belong to the parent class, such as its initializer.

// Now that you have a valid initializer in both of the classes, you can make an instance of Car like so:
let teslaX = Car(isElectric: true, isConvertible: false)
print(teslaX.isElectric)

// If a subclass does not have any of its own initializers, it automatically inherits the initializers of its parent class


// How to copy classes

// all copies ofa class instance share the same data, meaning that any changes you make toone copy will automatically change the other copies.
// This happens because classes are reference types in swift, which means all copies all refer back to the same underlying pot of data

// This has just one property, but because its stored in a class it will get shared across all copies of the class
class User {
    var username = "Anonymous"
}

var user1 = User()

// You could then take a copy of user1 and change the username value

var user2 = user1
user2.username = "Taylor"

print(user1.username)
print(user2.username)

// SwiftUI relies very heavily on classes for its data, specifically because they can be shared so easily
// In comparison, structs do not share their data amongst copies, meaning that if you change class User to struct User, you will get a different result when changing the names

// If you want to create a unique copy of a class instance - called a deep copy - you need to handle creating a new instance and copy across all of your data safely

class Person {
    var personName = "Anonymous"
    
    func copy() -> Person {
        let person = Person()
        person.personName = personName
        return person
        
    }
}*/
// Now you can safely call copy() to get na object with the same starting data but any future changes won't impact the original


// How to create a deinitializer for a class

/*
 Swift's classes can optionally be given a deinitializer, which is a bit like the opposite of an initializer in that it gets called when the object is destroyed rather than when its created
 
 This comes with a few small provisos:
 
 1. Just like initializers, you don't use func with deinitializers - they are special
 2. Deinitializers can never take parameters or return data, and as a result aren't even written with parentheses
 3. Your deinitializer will automatically be called when the final copy of a class instance is destroyed. That might mean it was created inside a function that is now finishing, for example.
 4. You never call deinitializers directly; they are handled automatically by the system
 5. Structs don't have deinitializers, because you can't copy them
 
 Exactly when your deinitializers are called depends on what you're doing, but really it comes down to a concept called scope. Scope more or less means "the context where information is available", and you've seen lots of examples already:
 
 1. If you create a variable inside a function, you can't access it from outside the function
 2. If you create a variable inside an if condition, that variable is not available outside the condition.
 3. If you create a variable inside a for loop, including the loop variable itself, you can't use it outside the loop
 */

// To demonstrate this, we can create a class that prints a message when its created and destroyed

/*class User {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user = User(id: i)
    print("user \(user.id): I'm in control!")
}


// How to work with variables inside classes

class User {
    var name = "Paul"
}

var user = User()
user.name = "Taylor"
user = User()
print(user.name)*/


// Checkpoint 7

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

// dog subclass
class Dog: Animal {
    func speak() {
        print("Woof!")
    }
}

// corgi and poodle subclasses
class Corgi: Dog {
    override func speak() {
        print("Arf Arf!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Yip Yip!")
    }
}

// cat subclass
class Cat: Animal {
    let isTame: Bool
    
    init(isTame: Bool, legs: Int  = 4) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("Meow!")
    }
}

// persian and lion subclasses
class Persian: Cat {
    override func speak() {
        print("Prrr!")
    }
}

class Lion: Cat {
    override func speak() {
        print("Roar!")
    }
}
