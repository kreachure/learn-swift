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
