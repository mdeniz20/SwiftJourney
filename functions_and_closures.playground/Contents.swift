import UIKit

// Defining Functions in Swift
/*
 Use the 'func' keyword to declare a function.
 Parentheses () are used to pass a list of arguments to the function.
 Use '->' to define the function's return type.
 */
print("Greeting Function:")
func greet(person: String, day: String, lunch: String) -> String {
    return "Hello \(person). We were expecting you \(day). We have \(lunch) today."
}
var greetingMessage = greet(person: "Markov", day: "Tuesday", lunch: "ham")
print(greetingMessage) // Prints a customized greeting

// Argument Labels in Functions
// Swift functions use argument labels by default to enhance readability.
// Use '_' to omit the argument label, or define a custom label before the parameter name.
print("\nFunctions without labeling:")
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greetingMessage = greet("Jacops", on: "Friday")
print(greetingMessage) // Prints another customized greeting

// Returning Multiple Values from a Function
/*
 Use a tuple to return multiple values from a function.
 Tuple elements can be referred to by name or by number.
 */
print("\nReturning tupple as parameter")
func calcStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) { //Returns a 3 element tupple labeled as following: min, max, sum
    var min = scores[0]
    var max = scores[0]
    var total = 0
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        total += score
    }
    return (min, max, total)
}
let statisticsResults = calcStatistics(scores: [8, 2, 187, 67, 8])
print("The sum of the values is: \(statisticsResults.sum)")
print("The min of the values is: \(statisticsResults.min)")


// Nested Functions
/*
 Nested functions are useful for organizing complex algorithms.
 You can declare a function inside another function.
 */
print("\nNested Functions:")
func return10() -> Int {
    var y = 5
    func add5() {
        y += 5
    }
    add5()
    return y
}
print(return10()) // Executes a nested function that modifies and returns a value

// Functions as First-Class Types
// Functions can return another function or take a function as an argument.
print("\nInner and Outer Functions:")
func makeIncrement() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return number + 1
    }
    return addOne
}
var increment = makeIncrement()
print(increment(5))
//or
print(makeIncrement()(5))


// Function as Argument
print("\nGiving a function as an argument:")
func doesMatch(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func isBiggerThan10(number: Int) -> Bool { //The condition function
    return number > 10
}

var numbers = [11, 8, 112, 0]
print(doesMatch(list: numbers, condition: isBiggerThan10)) // Check if any numbers are bigger than 10

// Closures
/*
 Closures are self-contained blocks of functionality.
 Swift provides several ways to write closures more concisely.
 */
print("\nClosures in Swift:")
// Full syntax
let tripledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 3
})

// Shorter syntax using type inference and implicit returns
let tripledNumbersShort = numbers.map { number in number * 3 }

// Shortest syntax using shorthand argument names
let tripledNumbersShortest = numbers.map { $0 * 3 }

// Using closures to sort an array
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)
