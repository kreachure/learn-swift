A closure is a piece of code in a block.
It can be assigned to a variable.
One can call the closure by its variable.

# Simple closures
```swift
// a simple closure
let assessment = {
  print("Hello user!")
  print("You have 50 points to Griffindor")
  print("And this is nice!")
}
assessment()
```
# Closure with parameters
```swift
// a closure with parameters
let assessment = {(user: String, points: Int) in
  print("Hello \(user)!")
  print("You have \(points) points to Griffindor")
  print("And this is nice!")
}

assessment("Harry", 50)
```
Rules for closures:
* closure parameters can't have external labels

# Closures returning values
```swift
// a closure returning value
let assessment = {(user: String, points: Int) -> String in
    
    print("Hello \(user)!")
    print("You have \(points) points to Griffindor")
    var effect: String
    switch points {
        case -100...0: effect = "lousy"
        case 1...10: effect = "OK"
        case 11...40: effect = "good!"
        default: effect = "terrific!"
    }
    print("And this is \(effect)!")
    return effect
}

let effect = assessment("Harry", 50)
```

# Trailing closure
If a function has a closure as last parameter, you can put closure right after the function:
```swift
// trailing closure
 func decorateAnAction(in wraps: Int, action: () -> Void) {
    for _ in 1..<wraps {
        print("{", terminator: "")
    }
    print("{")
    action()
    for _ in 1...wraps {
        print("}", terminator: "")
    }
}

decorateAnAction(in: 3){
    print("Rowing")
    print("Rowing")
    print("Rowing")
}
```
