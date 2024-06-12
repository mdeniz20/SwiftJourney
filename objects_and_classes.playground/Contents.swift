import UIKit

//To create classes in swifte, use 'class' keyword followed bu the class's name.
//Simple Class
print("Simple Class:")
class Shape{
    var numOfSides: Int = 0
    
    func setNumOfSides(side: Int){
        numOfSides = side;
    }
    
    func descripeShape() -> String{
        return "This shape has \(numOfSides) sides."
    }
}


//You can create an instance of a class by putting parantheses after the class name.
//You can access properties and methods of the instance.
var shape = Shape() //A new Shape object

shape.numOfSides = 7
//or
shape.setNumOfSides(side: 7)

var descOfShape = shape.descripeShape()
print(descOfShape)


//Now we are coding a better version of a class, we will implement an initializer.
//The keyword here is 'init'. This will be our initializer method.
//You can write 'deinit' method to do some cleanup before the object is deallocated.
//Class with initializer
print("\nClass with 'init' method:")
class NamedShape{
    var numOfSides: Int
    var name: String
    
    init(name: String, sides: Int){
        self.name = name
        self.numOfSides = sides
    }
    
    func describe()->String{
        return "\(name.capitalized) with \(numOfSides) sides."
    }
}
var namedShape = NamedShape(name: "triangle", sides: 3)
print(namedShape.describe())


//Subcalsses-Superclasses
//Subclasses include their superclass name after their class name.
//Those two names are seperated with ':' colon.
//Subclass's methods can override their superclass's implememntations.
//You should put 'override' keyword befor the method.
print("\nSuper-SubClasses:")
class Square: NamedShape{
    var sideLength: Double
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name: name, sides: 4)
    }
    
    func getArea() -> Double{
        return self.sideLength * self.sideLength
    }
    
    override func describe() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

let square = Square(sideLength: 7.1, name: "first square")
print("The area of the square is \(square.getArea())")
print(square.describe())

print("\nAnother Super-SubClasses:")
class Circle: NamedShape{
    var radius: Double
    
    init(radius: Double, name: String){
        self.radius = radius
        super.init(name: name, sides: 0)
    }
    
    func getArea() -> Double{
        return 3.14 * radius * radius
    }
    
    override func describe() -> String {
        return "A circle with radius \(radius)."
    }
}
let circle = Circle(radius: 3.7, name: "first circle")
print("The area of the square is \(circle.getArea())")
print(circle.describe())



//You can change the values of the properties if you want.
//To do that, using getter and setter methods are used to increase readibility.
print("\nClasses with getters and setters:")
class EquilateralTriangle: NamedShape{
    var sideLen: Double
    
    init(sideLen: Double, name: String){
        self.sideLen = sideLen
        super.init(name: name, sides: 3)
    }
    
    var perimeter: Double{
        get{
            return 3*sideLen
        }
        set{
            sideLen = newValue/3 //nameing newValue is default
            print("Side lengt has changed to \(sideLen)")
        }
    }
    
    var sideLength: Double{
        get{
            return sideLen
        }
        set(customNamedValue){ //You can customize the newValue name like this
            sideLen = customNamedValue
        }
    }
    
    override func describe() -> String {
        return "An equilateral triable with sides of lenth \(sideLen)"
    }
}

var triangle = EquilateralTriangle(sideLen: 4.2, name: "first eq. triangle")
print("Perimeter of the triangle with side length of \(triangle.sideLength) is \(triangle.perimeter).")
triangle.perimeter = 16.8
print("Perimeter of the triangle with side length of \(triangle.sideLength) is \(triangle.perimeter).")


//There are some other usefull methods apart from 'get' and 'set, and these are 'willSet' and 'didSet'.
/*
 'willSet' works before the value is changed, did set works after the value is changed.
 */
print("\n'willSet' and 'didSet':")
class User{
    var name: String {
        willSet(newUsername){
            print("The username will be changed from \(name) to \(newUsername).")
        }
        didSet{
            print("Your username has changed to \(name).")
        }
    }
    init(name: String) {
        self.name = name
    }
}
var user = User(name: "John Wick")
print("The user name is \(user.name) before attempting to change it.")
user.name = "Mickey Mouse"
print("The user name is \(user.name) now.")


//There is another complexier example
print("\nComplexier Example:")
class TriangleAndSquare{
    var triang: EquilateralTriangle{
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square{
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String){
        square = Square(sideLength: size, name: name)
        triang = EquilateralTriangle(sideLen: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 7, name: "first complex shape")
print("\tAfter initializing the triangleAndSquare object:")
print("\t\tThe square's side length is "+String(triangleAndSquare.square.sideLength))
print("\t\tThe trianle's side length is "+String(triangleAndSquare.triang.sideLength))

triangleAndSquare.square = Square(sideLength: 50, name: "A larger square")
print("\n\tAfter changing the sideLength of the square:")
print("\t\tThe square's side length is "+String(triangleAndSquare.square.sideLength))
print("\t\tThe trianle's side length is "+String(triangleAndSquare.triang.sideLength))

triangleAndSquare.triang = EquilateralTriangle(sideLen: 70, name: "A larger triangle")
print("\n\tAfter changing the sideLen of the triangle:")
print("\t\tThe square's side length is "+String(triangleAndSquare.square.sideLength))
print("\t\tThe trianle's side length is "+String(triangleAndSquare.triang.sideLength))
