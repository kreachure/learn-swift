# Closures: easy

A closure is a piece of code in a block.
It can be assigned to a variable.
One can call the closure by its variable.

## Simple closures
```swift
// a simple closure
let assessment = {
  print("Hello user!")
  print("You have 50 points to Griffindor")
  print("And this is nice!")
}
assessment()
```
## Closure with parameters
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

## Closures returning values
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

## Trailing closure
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

# Closures: the hard way
## Trailing closures accepting a parameter
```swift
// trailing closure accepting a parameter
 func decorateAnAction(in wraps: Int, action: (String) -> Void) {
    for _ in 1..<wraps {
        print("{", terminator: "")
    }
    print("{")
    action("Rowing")
    for _ in 1...wraps {
        print("}", terminator: "")
    }
}

decorateAnAction(in: 3){(activity: String) in
    for _ in 1...3 {
        print(activity)
    }
}
```

## Trailing closures returning value

## Shorthand parameter names
```swift
  func roundAndProcess(first arg1: Double, second arg2: Double, process: (Int, Int) -> Int) -> Int {
    let a1 = Int(arg1)
    let a2 = Int(arg2)
    return process(a1, a2)
}

let product = roundAndProcess(first: 4.0, second: 2.0){ first, second -> Int in
    first * second
}

let division = roundAndProcess(first: 4.0, second: 2.0){ $0 / $1 }
let sum = roundAndProcess(first: 4.0, second: 2.0){ $0 + $1 }
let rest = roundAndProcess(first: 4.0, second: 2.0){ $0 - $1 }

print("So, same function, different closures:",
      "\tProduct: \(product)",
      "\tDivision: \(division)",
      "\tSum: \(sum)",
      "\tRest: \(rest)", separator: "\n")
```
