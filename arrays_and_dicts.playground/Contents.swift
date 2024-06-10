/*
 In this playground, we explore the basics of arrays and dictionaries in Swift.
 Both data structures utilize square brackets ([]) for their syntax.
 You can access elements in arrays by their index and elements in dictionaries by their key.
 Additionally, in Swift, it is optional but acceptable to include a comma after the last element.
 */

import UIKit

// Creating an array with initial items
var shoppingList = ["tomato", "water", "milk", "tulips",]

// Modifying an element: changing the second item from 'water' to 'bottle of water'
shoppingList[1] = "bottle of water"

// Creating a dictionary with key-value pairs
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]

// Adding a new key-value pair to the dictionary
occupations["Jayne"] = "Public Relations"

// Updating the value associated with an existing key
occupations["Malcolm"] = "Head Captain"

// Printing the dictionary to see the changes
print(occupations)

// Adding a new item to the end of the array using .append()
shoppingList.append("knife")
print(shoppingList)

// Creating empty array and dictionary examples
var emptyArray: [String] = []
var emptyDictionary: [String: Float] = [:]

// Adding an item to the empty array
emptyArray.append("new value")
print(emptyArray)

// Adding a new key-value pair to the empty dictionary
emptyDictionary["New key"] = 4.32
print(emptyDictionary)
