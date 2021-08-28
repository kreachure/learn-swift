# Basic optionals
```swift
var string: String? = nil

// unwrapping with if let
if let unwarepped = string {
    print("Character count: \(unwarepped.count)")
} else {
    print("Empty line, no characters to count")
}

// unwrapping with guard let
func hello(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }
    print("Hello \(unwrapped)!")
}

hello(nil)
hello("Dmitry")

// forced unwrapping
let str = "55"
let num = Int(str)! // here goes the forced unwrapping

print("The num is \(num)")

// or you can use implicitly unwrapped optionals
let anotherNum: Int! = nil

// Nil coalescing
let user = anotherNum ?? 9
print("User is \(user)")

// Optionals chaining
var arr = ["Brady", "Dmitry", "Eugene"]
let letters = arr.first?.count          // the chaining
print("Letters in the first member: \(letters ?? 0)")
arr = [String]()
print("and now: \(arr.first?.count ?? 0)")
```
