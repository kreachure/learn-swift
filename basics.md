# Overview
* [Variables and simple data types](#variables-and-simple-data-types)
* [Complex data types: arrays, sets, dictionaries and enums](#complex-data-types-arrays-sets-dictionaries-and-enums)
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
