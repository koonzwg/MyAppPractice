//: [Previous](@previous)

import Foundation

/*
 Day 20
 - Guess the Flag: Introduction
 - Using stacks to arrange views
 - Colors and frames
 - Gradients
 - Buttons and images
 - Showing alert messages
 */


// Guess the Flag: Introduction


// Using stacks to arrange views
/*
 - If you want to return multiple things you have various options, but 3 are particularly useful. They are:
 
 1. HStack - Horizontal
 2. VStack - Vertical
 3. ZStack - Zepth
 
 There are 3 important differences when using VStack:
 
 1. Being explicit allows us to specify how much space to place between the views
 2. It also allows us to specify an alignment - whether the view should be placed on the left, right, or center of each other
 3. If we don't explicitly ask for a vertical stack, SwiftUI is free to arrange those views in a different way - if they were inside a larger view that used horizontal placement, they might also appear horizontally
 
 By default, VStack places some automatic amount of spacing between the 2 views, but we can control the spacing by providing a parameter when we create the stack
 
 VStack(spacing: 20) {
     Text("Hello, world!")
     Text("This is inside a stack")
 }
 
 You can also control the alignment with the alignment property
 
 VStack(alignment: .leading) {
     Text("Hello, world!")
     Text("This is inside a stack")
 }
 
 HStack is used to align things horizontally. Same syntax as VStack, including the ability to add spacing and alignment
 
 HStack(spacing: 20) {
     Text("Hello, world!")
     Text("This is inside a stack")
 }
 
 Vertical and horizontal stacks automatically fit their content, and prefer to align themselves to the center of the available space. If you want to change that you can use one or more Spacer views to push the contents of your stack to one side. These automatically take up all remaining space.
 
 ZStack is used to arrange things by depth - it makes views that overlap.
 
 ZStack doesn't have the concept of spacing because the views overlap, but it does have alignment. So if you have one large thing and one small thing inside your ZStack, you can make both views align to the top like this:
 
 ZStack(alignment: .top) {
 
 ZStack draws its contents from top to bottom, back to front, which means if you have an image then some text ZStack will draw them in that order, placing the text on top of the image.
 */


// Colors and frames
/*
 - Color.
 
 -background()
 
 -.frame
 
 - background() modifier can accept materials - these apply a frosted glass effect over whatever comes below them, which allows u to create some beautiful depth effects
 */


// Gradients
/*
 SwiftUI gives us 4 kinds of gradients to work with and like colors most of them are also views that can be drawn in our UI
 
 Gradients are made up of several components:
 1. An array of colors to show
 2. Size and direction information
 3. The type of gradient to use
 
 - Linear gradients
 - Linear gradients with stops
 
 - Radial gradients
 
 - Angular gradients
 */


// Buttons and images
/*
 There are a few different ways we can customize the way buttons look.
 
 1. We can attach a role to the button, which iOS can use to adjust its appearance both visually and for screen readers
 
 Button("Delete selection", role: .destructive, action: executeDelete)

 2. We can use one of the built-in styles for buttons: .bordered and .borderedProminent
 
 If you want to customize the colors used for a bordered button, use the tint() modifier
 
 Button("Button 3") { }
     .buttonStyle(.borderedProminent)
     .tint(.mint)
 
 - Apple recommends against using too many prominent buttons, because when everything is prominent nothing is
 
 If you want something completely custom, you can pass a custom label using a second trailing closure:
 
 Button {
     print("Button was tapped")
 } label: {
     Text("Tap me!")
         .padding()
         .foregroundStyle(.white)
         .background(.red)
 }
 
 - SwiftUI has a dedicated Image type for handling pictures in your apps, and there are 3 main ways you will create them:
 
 1. Image("pencil") will load an image called "Pencil" that you have added to your project
 2. Image(decorative: "pencil") will load the same image, but won't read it out for users who have enabled the screen reader. This is useful for images that don't convey additional important information
 3. Image(systemName: "pencil") will load the pencil icon that is built into iOS. This uses Apple's SF Symbols icon collection, and you can search for icons you like
 
 By default the screen reader will read your image name if it is enabled, so make sure you give your images clear names if you want to avoid confusing the user. Or, if they don't actually add information that isn't already elsewhere on the screen, use the Image(decorative:) initializer
 */


// Showing alert messages
/*
 If something important happens, a common way of notifying the user is using an alert - a pop up window that contains a title, message, and one or 2 buttons depending on what you need.
  
  When should an alert be shown and how?
  
  Views are a function of our program state, and alerts aren't an exception to that. So, rather than saying "show the alert", we instead create our alert and set the conditions under which it should be shown
  
  A basic SwiftUI alert has a title and a button that dismisses it, but the more interesting part is how we present the alert: we don't assign the alert to a variable then write something like myAlert.show() because that would be back to the old "series of events" way of thinking
  
  Instead, we create some state that tracks whether our alert is showing, like this:
  
  @State private var showingAlert = false
  
  We then attach our alert somewhere to our user interface, telling it to use that state to determine whether the alert is presented or not. SwiftUI will watch showingAlert and as soon as it becomes true it will show the alert
  
  Example:
  
  struct ContentView: View {
      @State private var showingAlert = false

      var body: some View {
          Button("Show Alert") {
              showingAlert = true
          }
          .alert("Important message", isPresented: $showingAlert) {
              Button("OK") { }
          }
      }
  }
 */
