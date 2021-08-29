# Part 1
## Simple form
```swift
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            Form {
                Section{
                    Text("Hello World")
                }
            }
            .navigationBarTitle("Swift UI")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
What's interesting here:
* `var body: some View`. "some" means it should be the same flavour of view every time.
* `NavigationView` adds a navigation pane on top of the screen
* Form adds a possibility to enter data
* `Form.navigationBarTitle(...)` sets a title of the navbar. NB: it's a method of a Form, not of NavigationView!

## Adding state
```swift
struct ContentView: View {
    @State private var tapCount = 0 // keeping state here
    
    var body: some View {
        NavigationView{
            Form {
                Section{
                    Button("Taps: \(tapCount)"){  // showing the state
                        tapCount += 1             // updating the state
                    }
                }
            }
            .navigationBarTitle("Swift UI")
        }
    }
}
```
`@State` modifier means this is a dynamically updated property of the struct.

## Two-way binding
```swift
struct ContentView: View {
    @State private var name = ""
    
    var body: some View {
        NavigationView{
            Form {
                Section{
                    TextField("Enter your name", text: $name) // here is the two-way binding
                    Text("Your name is \(name)")
                }
            }
            .navigationBarTitle("Swift UI")
        }
    }
}
```

## ForEach and Picker
```swift
struct ContentView: View {
    let students = ["Harry Potter", "Hermione Granger", "Ron Weasely", "Jeanny Weasely"]
    @State private var studentSelected = 0
    
    var body: some View {
        NavigationView{
            Form {
                Section{
                    Picker("Select student", selection: $studentSelected) {
                        ForEach(0 ..< students.count){ id in
                            Text(students[id])
                        }
                    }
                }
            }
            .navigationBarTitle("Swift UI")
        }
    }
}
```
Actually, the closure might be shorter:
```swift
ForEach(0 ..< students.count){
  Text(students[$0])
}
```

# Part 2
```swift
import SwiftUI

struct ContentView: View {
    let tipPercentages = [10, 15, 20, 25, 0]
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 1
    private var finalAmount: Double {           // computed property. No @State!
        let amount = Double(checkAmount) ?? 0.0 // optionals unwrapping
        let tip = amount * Double(tipPercentages[self.tipPercentage]) / 100
        let share = (amount + tip) / Double(self.numberOfPeople + 2)
        return share
    }
    
    var body: some View {
        NavigationView {  // navigation is important
            Form  {
                Section{
                    TextField("Amount", text: $checkAmount)
                    Picker("How many are you", selection: $numberOfPeople){
                        ForEach(2 ..< 100){
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("How much tip do you want to leave?")) { // Section with header
                    Picker("Tip percent", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count){ i in
                            Text("\(tipPercentages[i])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle()) // Picker style
                }
                Section{
                    Text("\(finalAmount, specifier: "%.2f")")  // Specifier for Text()
                }
            }
            .navigationBarTitle("We Split") // navigation bar at Form - not at Navigation View
        }
    }
}
```
