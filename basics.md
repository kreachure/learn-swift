# Overview
* [Variables and simple data types](#variables-and-simple-data-types)
* [Complex data types: arrays, sets, dictionaries and enums](#complex-data-types-arrays-sets-dictionaries-and-enums)
* [Operators and conditions](#operators-and-conditions)
* [Loops](#loops)
* [Functions](#functions)

# Variables and simple data types
```swift
var a_variable: String = "That's a variable"
let a_constant: String = "This is a constant"
```

## String
```swift
var greeting: String = "Hello world!"
let multistring: String = """
Hello Dolly
Well, Hello Dolly
It's so nice to have you back where you belong
"""

let multistring_no_caret: String = """
    Hello Dolly \
    Well, hello Dolly \
    It's so good to have you back where you belong
    """
```
## Numbers
```swift
let pi: Float = 3.1459
let e: Double = 2.71828

var employeeNumber: Int = 2
var numberOfHumansOnEarth = 7_500_000_000 // this is an Int too
```
## Boolean
```swift
var isAlive: Bool = true
var isDead: Bool = false
```
## String interpolation
To show a variable value in a string, use \() combination:
```swift
let myAge = 42
let confession = "I am \(myAge)."
```

# Complex data types: arrays, sets, dictionaries and enums
## Arrays
```swift
// Array
var names = [String]() // array of strings
names.append("Anton")
names.append("Handawn")
```

## Sets
Sets contain unique values stored in a specific order to find members fast. You can't address a member by its position though.
```swift
var potterSeries = Set(["The chamber of secrets", "The philosopher's stone"])
potterSeries.insert("The prisoner of Azkaban")
print(potterSeries)

var potterRoles = Set<String>()
potterRoles.insert("Harry Potter")
potterRoles.insert("Ron Weaseley")
potterRoles.insert("Hermione Granger")
print(potterRoles)
```

## Dictionaries
```swift
var potterCharacters = Dictionary<String,String>() // empty initalization
potterCharacters["Harry"] = "Potter"
potterCharacters["Ron"] = "Weasely"
print(potterCharacters)

let departments = ["DCS": "DataCenter Services", // non-emtpy initialization
                   "EUS": "End-User Services",
                   "SDEL": "Service Delivery",
                   "BADI": "Business Architecture & Design Integration"]
let badi = departments["BADI", default: "an unknown dept"]
print("BADI is an abbreviation for \(badi)")
```

## Enumerations

### Simple Enum
```swift
enum HogwardsHouse {
    case griffindor, slitherin, ravenclaw, hufflepuff
}
let griffindor = HogwardsHouse.griffindor
print(griffindor)
```

### Enum associated values
```swift
enum ServiceType {
    case FTE(assign: Float)
    case fix
    case itemBased(items: Int)
}

var roles = [String: ServiceType]()
roles["capacity manager"] = ServiceType.FTE(assign: 0.5)
roles["antivirus support"] = ServiceType.fix
roles["End-user support"] = ServiceType.itemBased(items: 354)

for r in roles {
    let service = r.value
    let name = r.key
    switch service {
        case .FTE(let assign): print("FTE service \(name) with assign of \(assign) FTE")
        case .itemBased(let items): print("Item-based service \(name) with \(items) items")
        case .fix: print("Fix service \(name)")
    }
}
```

### Enum raw based
```swift
enum Planet: Int {
    case mercury = 1
    case venus
    case earth
}
let earth = Planet(rawValue: 3)
print(earth ?? Planet.earth)
```

# Operators and conditions
Usual arithmetic operators used are: +, -, *, /, % (modulo)
`5 % 2 = 1`

## Conditions
```swift
if a == 2 && b != 4 {
    print("Success")
} else if c > "Alpha" {
    print("Half-success")
} else {
    print("Failure")
}
```

## Ternary operator
```swift
var a = (a == 0 ? 1 : 2)
```

## Range operators
```swift
let range = 1...10
for c in range {
    print("\(c)", terminator: "")
}
```
This code yields the following value: `1234567910`
If we use `..<` instead of `...`, the last value is not included:
```swift
let range = 1..<10
for c in range {
    print("\(c)", terminator: "")
}
```
...gives us `123456789`

## Switch statement
```swift
let a = 3

switch a {
    case 1: print("Mercury")
    case 2: print("Venus")
    case 3: print("Earth")
    default: print("No idea what planet it is")
}
```

# Loops
```swift
// for
for i in 1...10 {
    print("\(i)", terminator: "")
}

// while
var i = 0
while i < 10 {
    print("\(i)", terminator: "")
    i += 1
}

// repeat while
repeat {
    print("\(i)", terminator: "")
    i += 1
} while i<10

// exiting multiple loops
outerLoop: for i in 1..<10 {
    for j in 1..<10 {
        print("i*j = \(i*j)")
        if i>3 && j>4 {
            break outerLoop
        }
    }
}

// continue
for i in 1...10 {
    if i % 2 == 0 {
        continue
    }
    print("\(i)", terminator: " ")
}
```

# Functions
```swift
// simple func with a parameter and return value
func duplicate(number: Int) -> Int {
    return 2*number
}

// parameter labels: "to" is external label, "name" is internal variable name
func sayHello(to name: String) -> String {
    return "Hello \(name)!"
}
print(sayHello(to: "Dmitry"))

// You can omit parameter label:
func greet(_ name: String) -> String {
    return "Hello \(name)"
}
print(greet("Dmitry"))

// Parameters with default values
func tellStory(about hero: String, sex: String="He"){
    print("\(hero) went on a trip. \(sex) was tired.")
}

tellStory(about: "Dmitry")
tellStory(about: "Clementina", sex: "She")

// Variadic functions
func multiply(numbers: Int...) -> Int {
    var result = 1
    for n in numbers{
        result *= n
    }
    return result
}
multiply(numbers: 2, 4, 5, 8)

// Parameters by reference (inout)
var a = 2
func duplicateParameterItself(arg: inout Int){
    arg *= 2
}
duplicateParameterItself(arg: &a)

// throw, do, try, catch
enum MyError: Error {
    case divisionByZero
}

func divide(a: Int, b: Int) throws -> Int {
    if b == 0 {
        throw MyError.divisionByZero
    }
    return a/b
}

do {
    var c = 0, a = 10, b = 0
    try c = divide(a: a, b: b)
    print("\(a)/\(b)=\(c)")
} catch {
    print("Can't divide by zero")
}
```
