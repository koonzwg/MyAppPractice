//: [Previous](@previous)

import Foundation

/*
 Day 17
 - Reading text from the user with TextField
 - Creating pickers in a form
 - Adding a segmented control for tip percentages
 - Calculating the total per person
 - Hiding the keyboard
 */


// Reading text from the user with TextField
/*
 - Locale is a massive struct built into iOS that is responsible for storing all the user's region settings - what calendar they use, how they eparate thousands digits in numbers, whether they use the metric system and more.
 
 In our case, we're asking whether the user has a preferred currency code, and if they don't we'll fall back to USD so at least we have something
 
 Form {
    Section {
        TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            .keyboardType(.decimalPad)
    }
     
     Section {
         Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
     }
 }
 
 - Synchronization happens because:
 1. Our text field has a 2 way binding to the checkAmount property
 2. The checkAmount property is marked with @State, which automatically watches for changes in the value
 3. When an @State property changes SwiftUI will re-invoke the body property (i.e., reload our UI)
 4. Therefore the text view will get the updated value of checkAmount
 
 - Text fields have a modifier that lets us force a different kind of keyboard: keyboardType()
 
 We can give this a parameter specifying the kind of keyboard we want, and in this instance either .numberPad or .decimalPad are good choices
 
 */


// Creating pickers in a form
/*
 - SwiftUI's pickers serve multiple purposes, and exactly how they look depends on which device you're using and the context where the picker is used
  
  Pickers, like text fields, need a 2 way binding to a property so they can track their value.
  
  - Declarative user interface design: We say what we want rather than say how it should be done.
  
  We said we wanted a navigation link picker with some values inside, but we didn't have to say "now create a list of all our items, showing a checkmark to whichever is selected right now."
  
  - Its tempting to think that modifier should be attached to the end of NavigationStack, but it needs to be attached to the end of the Form instead. The reason is that navigation stacks are capable of showing many views as your program runs, so by attaching the title to the thing inside the navigation stack we're allowing iOS to change titles freely
 */


// Adding a segmented control for tip percentages
/*
 Now we're going to add a second picker view to our app, but this time we want something slightly different: we want a segmented control
  
  - Segmented control: A specialized kind of picker that shows a handful of options in a horizontal list, and it works great when you have only a small selection to choose from
  
  Section {
      Picker("Tip percentage", selection: $tipPercentage) {
          ForEach(tipPercentages, id: \.self) {
              Text($0, format: .percent)
          }
      }
      .pickerStyle(.segmented)
  }
  
  That loops over all the options in our tipPercentages array, converting each one into a text view with the .percent format.
  
  .pickerStyle(.segmented) - Displays the options horizontally and looks much better
  
 */


// Calculating the total per person
/*
 - In order to get the total per person, we need to do a small amount of mathmatics
  To do this, we will add a computed property that calculates the total
  
  The total amount payable per person = value of the order + the tip % / number of people
  
  Before we do that, we need to pull out the values for how many people there are, what the tip percentage is and the value of the order.
 */


// Hiding the keyboard
/*
 - Once the keyboard appears for the check amount entry, it never goes away
  This is a problem with the decimal and number keypads, because the regular alphabetic keyboard has a return key on there to dismiss the keyboard. However, with a little extra work we can fix this:
  1. We need to give SwiftUI some way of determining whether the check amount box should currently have focus - should be receiving text input from the user
  2. We need to add some kind of button to remove that focus when the user wants, which will in turn cause the keyboard to go away
  
  - @FocusState: Similar to @State, except it's specifically designed to handle input focus in our UI
  
  @FocusState private var amountIsFocused: Bool
  
  Now you can attach that to your text field, so that when the text field is focused amountIsFocused is true, otherwise its false. Add this modifier to your TextField:
  .focused($amountIsFocused)
  
  .toolbar {
      if amountIsFocused {
          Button("Done") {
              amountIsFocused = false
          }
      }
  }
  
  1. The .toolbar() modifier lets you specify toolbar items for a view. These toolbar items might appear in various places on the screen - in the navigation bar at the top, in a special toolbar area at the bottom and so on
  2. The condition checks whether amountIsFocused is currently true, so we only show the button when the text field is active
  3. The Button view we're using here displays some tappable text, which in our case is "Done". We also need to provide it with some code to run when the button is pressed, which in our case sets amounIsFocused to false so that the keyboard is dismissed
 */
