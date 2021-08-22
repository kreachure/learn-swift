# Overview
* [Variables and simple data types](#variables-and-simple-data-types)
# Variables and simple data types
```swift
var a_variable: String = "That's a variable"
let a_constant: String = "This is a constant"
```
## Simple types:
### String
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
### Numbers
```swift
let pi: Float = 3.1459
let e: Double = 2.71828

var employeeNumber: Int = 2
var numberOfHumansOnEarth = 7_500_000_000 // this is an Int too
```
### Boolean
```swift
var isAlive: Bool = true
var isDead: Bool = false
```
### String interpolation
To show a variable value in a string, use \() combination:
```swift
let myAge = 42
let confession = "I am \(myAge)."
```
* Int
* String
* Float, Double
* Bool
