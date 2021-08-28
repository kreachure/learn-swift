# Basic optionals

`if let x = optionalvar { (... x) } else { ... }` construct deals with optional `optionalvar`.
If `optionalvar` is `nil`, the `else` part goes on, otherwise the first bracketed block runs.

```swift
var string: String? = nil

// unwrapping with if let
if let unwarepped = string {
    print("Character count: \(unwarepped.count)")
} else {
    print("Empty line, no characters to count")
}
```
# Guard let
Guard let exits from the current block if the value being unwrapped (`name` below) is `nil`.
Otherwise it goes on.
```swift
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
```
# Forced unwrapping
```swift
// forced unwrapping
let str = "55"
let num = Int(str)! // here goes the forced unwrapping

print("The num is \(num)")

// or you can use implicitly unwrapped optionals
let anotherNum: Int! = nil
```
# Nil coalescing
```swift
// Nil coalescing
let user = anotherNum ?? 9
print("User is \(user)")
```
The above gives `anotherNum` or 9 if the variable is `nil`.

# Optionals chaining
```swift
// Optionals chaining
var arr = ["Brady", "Dmitry", "Eugene"]
let letters = arr.first?.count          // the chaining
print("Letters in the first member: \(letters ?? 0)") // returns 5 - the number of characters in word "Brady"
arr = [String]()
print("and now: \(arr.first?.count ?? 0)") // returns 0 because arr.first is nil
```

# Optional try
`try? func()` returns `nil` if the func throws an exception.
```swift
enum PasswordError: Error {
    case obvious
}

func checkPassword(password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    
    return true
}

if let retVal = try? checkPassword(password: "smth"){ // the optional try
    print("Return value: \(retVal), and it's alright!")
} else {
    print("D'oh!")
}
```
`try! func()` also unwraps optional value, though it will crash if the value is `nil`.

# Failable initializers `init?()`
To indicate that initialization wasn't successful, retrun `nil` from `init?()`:
```swift
struct Employee {
    var id: String
    var firstName: String
    var lastName: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    init?(_ id: String){
        if id.count != 9 {
            return nil
        }
        self.id = id
        self.firstName = "John"
        self.lastName = "Doe"
    }
}

let john = Employee("123456789")
let anon = Employee("15")

print("John is \(john!.fullName), while anon is \(anon?.fullName ?? "no object")")
```
Returns: `John is John Doe, while anon is no object`

# Typecasting
```swift
class Animal {}
class Fish: Animal {}
class Dog: Animal {
    func bark(){
        print("Aroo!")
    }
}

let animals = [Fish(), Animal(), Dog()] // based on first two items, Swift creates Array<Animal>()

for pet in animals {
    if let dog = pet as? Dog {
        dog.bark()
    } else {
        print("Not a dog...")
    }
}
```
