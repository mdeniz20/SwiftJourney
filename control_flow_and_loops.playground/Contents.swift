import UIKit

/*
 This section explores control structures in Swift, including conditionals and loops.
 Swift allows the use of 'if' and 'switch' for conditionals, and 'for-in', 'while', and 'repeat-while' for loops.
 Parentheses around conditions or loop variables are optional in Swift, but curly braces ({}) are required to define the scope of blocks.
 */

// Example of a for-in loop to calculate a cumulative score
let memberScores = [80, 18, 78, 55, 8]
var overallScore = 0
for score in memberScores {
    if score > 50 {
        overallScore += 3
    } else {
        overallScore += 1
    }
}
print(overallScore) // Prints 11

// Handling optional values in Swift
/*
 Swift uses optionals to handle the absence of a value. Optionals are declared with a '?' following the type.
 This is similar to checking for null values in other languages.
 */

var optionalStr: String? = "Hello"
print(optionalStr == nil) // Prints "false" because 'optionalStr' has a value of "Hello"

var optionalName: String? = "Martin"
var greeting: String  //The value of greeting will be set later

print("\nWhen optional value is defined:")
if let name = optionalName { // This syntax unwraps 'optionalName' if it is not nil
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello!"
}
print(greeting)

print("\nWhen optional value is not defined:")
optionalName = nil
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello!"
}
print(greeting)

// Handling 'nil' values with the '??' operator, which provides a default value if the optional is nil
print("\nHandling 'nil' values with '??' operator")
let nickname: String? = nil
let fullName: String = "John Pepper"
let informalGreeting = "Hi \(nickname ?? fullName)" // Uses 'fullName' if 'nickname' is nil
print(informalGreeting)

// Switch cases in Swift are not limited to integers and can evaluate any type, including strings.
print("\nSwitch examples:")
let vegetable = "red pepper"
switch vegetable {
case "tomato":
    print("This will make your soup in color red.")
case "cucumber", "watercress":
    print("Good for sandwiches.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

// Using for-in loops with dictionaries
print("\nfor-in with dictionaries:")
let popularNumbers = [
    "Prime Numbers": [2, 3, 5, 7, 11, 13],
    "Fibonacci Seq": [1, 1, 2, 3, 5, 8],
    "Square Numbers": [1, 4, 9, 16, 25],
]
var largest = Int.min
var smallest = Int.max
var category = ""

for (key, numbers) in popularNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            category = key
        }
        if number < smallest {
            smallest = number
            category = key
        }
    }
}
print("In the dictionary 'popularNumbers': The largest number is \(largest) in \(category), the smallest is \(smallest) in \(category).")

// Demonstrating the use of while loops
var n = 2
while n < 100 {
    n *= 2
}
print(n) // Prints 128

// Using a repeat-while loop to ensure the loop body executes at least once
n = 2
repeat {
    n *= 2
} while n < 100
print(n) // Prints 128

// Using '..<' and '...' range operators in for loops to manage indexes
print("\nRange operators in for loops:")
var total = 0
for i in 0..<4 { // The '..<' operator does not include the upper limit.
    total += i
}
print(total) // Prints 6

total = 0
for _ in 0...10 { // The '...' operator includes both ends of the range.
    total += 1
}
print(total) // Prints 11
