//
//  main.swift
//  Initialization
//
//  Created by 向海涛 on 15/11/3.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

//MARK: init
struct Fahrenheit {
    var temperature: Double
    
    init() {
        temperature = 32.0
    }
}

let fahrenheit = Fahrenheit()
print(fahrenheit.temperature)

//MARK: default property Values

struct Fahrenheit2 {
    var temperature = 33.0
}

//MARK: Initialization Parameters
struct Celsius {
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0)/1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
}

let celsius = Celsius(fromFahrenheit: 212.0)

let celsius2 = Celsius(fromKelvin: 273.15)

//MARK: Local and External Parameters Name

struct Color {
    let red,green,blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.blue = blue
        self.green = green
        self.red = red
    }
    
    init(white: Double) {
        red = white
        blue = white
        green = white
    }
}

let color1 = Color(red: 0.2, green: 0.3, blue: 0.4)
let color2 = Color(white: 0.6)

struct Color2 {
    let red,blue :Double
    
    init( _ red: Double, _ blue: Double) {
        self.red = red
        self.blue = blue
    }
    
    init(_ white: Double) {
        self.red = white
        self.blue = white
    }
}

let color3 = Color2(1)
let color4 = Color2(1,2)

//MARK: optional Property Types

class SurveyQuestion {
    var text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let surveyQuestion = SurveyQuestion(text: "Do you like cheese ?")
surveyQuestion.ask()
surveyQuestion.response = "Yes, I do like cheese."

//MARK: Defualt Initializers
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = true
}

let shoppingListItem = ShoppingListItem()

//MARK: Memberwise Initializers for Structure Types

struct Size {
    var width = 0.0,height = 0.0
}

let size = Size(width: 22, height: 33)

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    init() {}
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - size.width / 2
        let originY = center.y - size.height / 2
        
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

var rect = Rect()
rect = Rect(center: Point(x: 0.2, y: 0.5), size: Size(width: 22, height: 22))
rect = Rect(origin: Point(x: 0, y: 0), size: Size(width: 44, height: 88))

//MARK: Designated and Convenience Initializers 

class Vehicle {
    var numbersOfwheels = 0
    var description: String {
        return "\(numbersOfwheels) wheels"
    }
}

let vehicle = Vehicle()
print(vehicle.description)

class Biycle: Vehicle {
    override init() {
        super.init()
        numbersOfwheels = 2
    }
}

let biycle = Biycle()
print(biycle.description)

class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let nameMeat = Food(name: "meat")
let unnanedFood = Food()

class RecipeIngredient: Food {
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
    
}

var recipeIngredient = RecipeIngredient()
print(recipeIngredient.quantity)
recipeIngredient = RecipeIngredient(name: "meat")
print(recipeIngredient.quantity)
recipeIngredient = RecipeIngredient(name: "meat", quantity: 3)
print(recipeIngredient.quantity)

//MARK: Failable initializers

struct Animal {
    var species: String
    
    init?(species: String) {
        if species.isEmpty {return nil }
        self.species = species
    }
}

var someGreature = Animal(species: "Giraffe")

if let animal = someGreature {
    print("An animal was initialized with a species of \(animal.species)")
}

enum TemperatureUnit {
    case Kelvin, Celsius, Fahenheit
    
    init?(symnol: Character) {
        switch symnol {
        case "K" :
            self = .Kelvin
        case "C" :
            self = .Celsius
        case "F" :
            self = .Fahenheit
        default :
            return nil
        }
    }
}

var temperature = TemperatureUnit(symnol: "C")

if let tem = temperature {
    print("temperature is not nil")
} else {
    print("temperature is nil ")
}

enum Temperature2: Character {
    case Kelvin = "K", Celsius = "C", Fahenheit = "F"
}

var temperature2 = Temperature2(rawValue: "X")

if temperature2 == nil {
    print("temperature2 is nil")
}

class Product {
    var name: String!
    
    init?(name: String){
        self.name = name
        if name.isEmpty {return nil}
    }
}

class CartItem: Product {
    let quantity: Int!
    init?(name: String,quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
        if quantity < 1 {return nil}
    }
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("item: \(zeroShirts.name), quantity:\(zeroShirts.quantity)")
} else {
    print("unable to initialize zero shirts")
}

if let zeroShirts = CartItem(name: "", quantity: 3) {
    print("item: \(zeroShirts.name), quantity:\(zeroShirts.quantity)")
} else {
    print("unable to initialize zero shirts")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 3) {
    print("item: \(zeroShirts.name), quantity:\(zeroShirts.quantity)")
} else {
    print("unable to initialize zero shirts")
}

//MARK: Overriding a Failable Initializer

class Document {
    var name: String?
    
    init() {
        
    }
    
    init?(name: String) {
        self.name = name
        if name.isEmpty {return nil}
    }
}

class SubDocument: Document {
    override init() {
        super.init()
        self.name = "[unnamed]"
    }
    
    override init!(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[unnamed]"
        } else {
            self.name = name
        }
        
    }
}

//MARK: required Initializers

class SomeClass {
    required init() {
        
    }
}

class subClass: SomeClass {
    required init() {
        
    }
}

//MARK: set a default property Value with a function or a closure

class SomeClass2 {
    let property: String = {  //someType
        
        return ""               //value
    }()
}

struct Checkerboard {
    let boardColors: [Bool] = {
        var temporary = [Bool]()
       var isBlack = false
        for i in 1...10 {
            for j in 1...10 {
               temporary.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporary
    }()
    
    func squareIsblackAtRow(row: Int, colunm: Int) -> Bool {
        return boardColors[row * 10 + colunm]
    }
}

let board = Checkerboard()

print(board.squareIsblackAtRow(0, colunm: 2))

print(board.squareIsblackAtRow(3, colunm: 6))






