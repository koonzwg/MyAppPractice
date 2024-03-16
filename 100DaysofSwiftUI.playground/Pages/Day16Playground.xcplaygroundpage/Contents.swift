//: [Previous](@previous)

import Foundation

/*
 Day 16:
 - WeSplit: Introduction
 - Understanding the basic structure of a SwiftUI app
 - Creating a form
 - Adding a navigation bar
 - Modifying program state
 - Binding state to user interface controls
 - Creating views in a loop
 */


// WeSplit: Introduction
/*
 This project - like all the projects that involve building a complete app - is broken down into 3 stages:
 1. A hands-on introduction to all the techniques you'll be learning
 2. A step-by-step guide to build the project
 3. Challenges for you to complete on your own, to take the project further
 */


// Understanding the basic structure of a SwiftUI app
/*
 - WeSplitApp.swift contains code for launching your app. If you create something when the app launches and keep it alive the entire time, you'll put it here
 - ContentView.swift contains the initial user interface(UI) for your program, and is where we'll be doing all the work in this project
 - Assets.xcassets is an asset catalog - a collection of pictures that you want to use in your app. You can also add colors here, along with app icons, iMessage stickers, and more
 - Preview Content is a group, with Preview Assets.xcassets inside - this is another asset catalog, this time specifically for example images you want to use when you're designing your user interfaces, to give you an idea of how they might look when the program is running
 
 1. import SwiftUI - tells swift that we want to use all the functionality given to us by the SwiftUI framework. Apple provides you with many frameworks for things like:
 
 - Machine learning
 - Audio playback
 - Image processing
 
 and more, so rather than assume our program wants to use everything ever we instead say which parts we want to use so they can be loaded
 
 2. struct ContentView: View - creates a struct called ContentView, saying that it conforms to the View protocol.
 
 View comes from SwiftUI and is the basic protocol that must be adopted by anything you want to draw on the screen - all text, buttons, images, and more are all views, including your own layouts that combine other views
 
 3. var body: some View - defines a new computed property called body, which has an interesting type: some View. This means it will return something that conforms to the View protocol, which is our layout.
 
 The View protocol has only 1 requirement, which is that you have a computed property called 'body' that returns 'some View'
 
 4. VSTack
 
 5. imageScale(), forgroundStyle() and padding()
 
 Methods being called on the image and VStack
 This is what SwiftUI calls a modifier, which are regular methods with one small difference: they always return a new view that contains both your original data, plus the extra modification you asked for.
 
 6. #Preview - Won't actually form part of your final app that goes to the App Store, but is instead specifically for Xcode to use so it can show a preview of your UI design alongside your code.
 
 Option+Cmd+P does the same as clicking the refresh button for the preview
 
 */


// Creating a form
/*
 Form - Scrolling lists of static controls like text and images, but can also include user interactive controls like text fields, toggle switches, buttons and more
 
 Section - Allows you to split up your form into visual chunks
 */


// Adding a navigation bar
/*
 1. Safe area - The default in which SwiftUI ensures components are placed in an area where they can't be covered up by system UI or device rounded corners - an area known as the safe area
 
 2. Cmd+R - runs the simulator
 
 3. Navigation bars (NavigationStack) - Can have titles and buttons, and in SwiftUI they also give us the ability to display new views when the user performs an action.
 
 Use "NavigationStack" allows you to create a navigation bar
 */


// Modifying program state
/*
 - "Views are a function of their state": The way your user interface looks - the things people can see and what they can interact with - are determined by the state of your program. For example, they can't tap Continue until they have entered their name in a text field
 - State: The active collection of settings that describe how the game is right now
 - When creating struct methods that want to change properties, we need to add the mutating keyword: mutating func doSomeWork()
  
  but swift doesn't let you make mutating computed properties, which means we can't write mutating var body: some View (not allowed)
  
  Solution = property wrapper
  
  - Property wrapper: a special attribute you can place before your properties that effectively gives them super-powers. In the case of storing simple program state like the number of times a button was tapped, we can use a property wrapper from SwiftUI called '@State'
  
  - @State: Allows you to work around the limitation of structs: we know we can't change their properties because structs are fixed, but @State allows that value to be stored separately by SwiftUI in a place that can be modified.
  
  Why not use classes instead since they can be modified freely? SwiftUI destroys and recreates your structs frequently, so keeping them small and simple is important for performance.
  
  - There are several ways of storing program state in SwiftUI
  
  @State is specifically designed for simple properties that are stored in one view. As a result, apple recommends we add private access control to those properties like this:
  
  @State private var tapCount = 0
 */


// Binding state to user interface controls
/*
 - @State property wrapper lets you modify your view structs freely, which means as the program changes we can update our view properties to match
  
 - Two way binding: we bind the text field so that it shows the value of our property, but we also bind it so that any changes to the text field also update the property
  
  Two way bindings are marked with a special symbol so they stand out: we write a dollar sign before them
  
  This tells swift that it should read the value of the property but also write it back as any changes happen
  
  struct ContentView: View {
      @State private var name = ""
      
      var body: some View {
          Form {
              TextField("Enter your name", text: $name)
              Text("Your name is \(name)")
          }
      }
  }
  
 */


// Creating views in a loop
/*
 - It's common to want to create several SwiftUI views inside a loop.
  
  For example, we might want to loop over an array of names and have each one be a text view, or loop over an array of menu items and have each one be shown as an image
  
  SwiftUI gives us a dedicated view type for this purpose, called ForEach
  
 - ForEach: Can loop over arrays and ranges, creating as many views as needed
  
  ForEach will run a closure once for every item it loops over, passing in the current loop item.
  
  Example: This creates a form with 100 rows:
  
  Form {
      ForEach(0..<100) { number in
      Text("Row \(number)")
      }
  }
  
  Because ForEach passes in a closure, we can use shorthand syntax for the parameter name, like this:
  
  Form {
      ForEach(0..<100) {
      Text("Row \($0)")
      }
  }
  
  ForEach is particularly useful when working with SwiftUI's Picker view, which lets us show various options for users to select from
  
  - To demonstrate this, we're going to define a view that:
  1. Has an array of possible student names
  2. Has an @State property storing the currently selected student
  3. Creates a Picker view asking users to select their favorite, using a two-way binding to the @State property
  4. Uses ForEach to loop over all possible student names, turning them into a text view
  
  struct ContentView: View {
      let students = ["Harry", "Hermione", "Ron"]
      @State private var selectedStudent = "Harry"
      
      var body: some View {
          NavigationStack {
              Form {
                  Picker("Select your student", selection: $selectedStudent) {
                      ForEach(students, id: \.self) {
                          Text($0)
                      }
                  }
              }
          }
      }
  }
  
  Theres not a lot of code in there, but it's worth clarifying a few things:
  1. The students array doesn't need to be marked with @State because its a constant; it isnt going to change
  2. The selectedStudent property starts with the value "Harry" but can change, which is why it's marked with @State
  3. The Picker has a label, "Select your student", which tells users what it does and also provides something descriptive for screen readers to read aloud
  4. The Picker has a two-way binding to selectedStudent, which means it will start showing a selection of "Harry" but update the property when the user selects something else.
  5. Inside the ForEach we loop over all the students
  6. For each student we create one text view, showing that students name.
  
  Confusing part: ForEach(students, id: \.self) - This loops over the studetns array so you can create a text view for each one, but the id: \.self is important
  
  This exists becaus SwiftUI needs to be able to identify every view on the screen uniquely, so it can detect when things change
  
  \.self = "The strings themselves are unique" which allows SwiftUI to create many views and captures the identifier that makes each item in our string array unique
 */
