Here we actually have two sections:
* [Structs, properties, and methods](#structs-properties-and-methods)
* [Classes](#classes)
* [Protocols](#protocols)
* [Extensions](#extensions)
* [Protocol extensions](#protocol-extensions)

# Structs, properties and methods
## Simple struct
```swift
struct Task {
    var title: String
    var effortHours: Int
    var employeesNum: Int
    var totalEstimate: Int {
        return effortHours * employeesNum
    }
}

var myTask = Task(title: "Learn Swift", effortHours: 10, employeesNum: 2)
print("Total estimate: \(myTask.totalEstimate)")
```

## Observers
```swift
struct Task {
    var title: String
    var effortHours: Int
    var employeesNum: Int {
        willSet { // observer before update
            print("\(title) is going to set employeesNum (\(employeesNum) so far...)")
        }
        didSet { // observer on update
            print("\(title) has now \(employeesNum) employees set.")
        }
        
    }
    var totalEstimate: Int {
        return effortHours * employeesNum
    }
}

var myTask = Task(title: "Learn Swift", effortHours: 10, employeesNum: 2)
print("Total estimate: \(myTask.totalEstimate)")
myTask.employeesNum = 3
```

## Methods
...are simply functions with access to struct properties
```swift
struct Employee {
  var firstName: String
  var lastName: String
  
  func fullName() -> String {
    return "\(firstName) \(lastName)"
  }
}
```

If a method is altering intrinsic properties, then it's a mutating method:
```swift
struct Employee {
  var firstName: String
  var lastName: String
  
  func fullName() -> String {
    return "\(firstName) \(lastName)"
  }
  
  mutating func capitalize() {
    firstName = firstName.capitalized
    lastName = lastName.capitalized
  }
}
```
## Some additional stuff
* initalizers
* static properties
* lazy properties
* access modifiers

```swift
func longRunningFunction() -> Int {
    print("The long running function has fired")
    return 3
}

struct Employee {
    static var elements: Int = 0 // static property
    private var id: Int
    var firstName: String
    var lastName: String
    lazy var aProperty: Int = longRunningFunction() // lazy property
    
    // initializer
    init(){
        self.id = Int.random(in: 1...100)
        self.firstName = "John"
        self.lastName = "Doe"
        Employee.elements += 1
    }
    
    init(firstName: String, lastName: String) {
        self.init()
        self.firstName = firstName
        self.lastName = lastName
    }
  
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
    
    mutating func capitalize() {
        firstName = firstName.capitalized
        lastName = lastName.capitalized
    }
    
}

var employee = Employee(firstName: "dmitry", lastName: "chernyshev")
print(employee.fullName())
employee.capitalize()
print(employee.fullName())
print(Employee.elements)
```

# Classes
Classes have a few differences from structs:
* Classes must have initializers if they have properties
* Inheritance like in `class Beagle: Dog`; and you can use `super.init(params go here)`
* You can override methods
* Classes can be `final` - then you can inherit from them
* `employee2 = employee1` copies the object if it's a **struct**; it creates a references to the same object if it's a **class**
* A class can have deinitializer `deinit {}`
* Mutability. Even a constant object of a class can have variable properties. So, there is no point to use `mutating` modifier of a func. But you can declare constant properties with `let`.

Examples!
```swift
class Dog {
    var breed: String
    var name: String
    
    init() {
        self.breed = "mongrel"
        self.name = "Noname"
    }
    
    func bark(){
        print("Woof!")
    }
}

final class Beagle: Dog {
    override init() {
        super.init()
        self.breed = "beagle"
    }
    
    override func bark(){
        print("Aroo!")
    }
    
    deinit {
        print("Should be no name anymore: \(self.name)")
    }
}

var mongrel = Dog()
mongrel.name = "Sharik"
mongrel.bark()

var mongrel1 = mongrel
print(mongrel.name) // same name, it's just another reference to the same object

var beagle = Beagle()
beagle.name = "Cheeroo"
beagle.bark()
```

# Protocols
...are something similar to interfaces in java: you define which properties (with getters and setters) and methods are necessary to create to inherit a protocol.
Structs can inherit from protocols:
```swift
protocol Named {
    var name: String {get set}
}
protocol Barking {
    func bark() -> Void
}

class Dog: Barking, Named {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func bark(){
        print("Woof!")
    }
}

let cheero = Dog(name: "Cheeroo")
cheero.bark()
```

# Extensions
You can extend existing types:
```swift
extension Int {
    var squared: Int {
        self * self
    }
}

var two: Int = 2
print(two.squared)
```

# Protocol extensions
Adding an extension to a protocol, adds some functionality to all structs/classes which *conform* to the protocol:
```swift
protocol Named {
    var name: String { get set }
}

extension Named {
    mutating func capitalize() {
        self.name = self.name.capitalized
    }
}

class Dog: Named {
    var name: String
    
    init(name: String){
        self.name = name
    }
}

var cheeroo = Dog(name: "cheeroo")
cheeroo.capitalize()
print(cheeroo.name)
```
