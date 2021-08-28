# Simple form
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

# Adding state
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

# Two-way binding
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

# ForEach and Picker
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
