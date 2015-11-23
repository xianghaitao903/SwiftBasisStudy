//
//  main.swift
//  Protocols
//
//  Created by 向海涛 on 15/11/23.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

//MARK: protocol syntax
protocol SomeProtocol {
    
}
/*
struct SomeStruct: SomeProtocol, OtherProtocol{
    
}

class SomeClass: SuperClass, SomeProtocol, Otherprotocol {

}

*/
//MARK: Property Requirements 

protocol RequirementsProtocol {
    var mustBesettable: Int { get set }
    var doesNotNeedBeSettable: String { get }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullName {
    var fullName: String { get }
}

struct Person: FullName {
    var fullName: String
}

let john = Person(fullName: "john AppleSeeds")

class StartShip: FullName {
    var prefix: String?
    var name: String
    init(prefix: String? = nil, name: String) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + "" : "") + name
    }
}

//MARK: method requirements

protocol TypeMethodProtocol {
    static func smoeTypeMethod()
}

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    var m = 139968.0
    var a = 3877.0
    var c = 29573.0
    
    func random() -> Double {
        lastRandom = ( lastRandom * a + c ) % m
        return lastRandom / m
        
    }
}

let generator = LinearCongruentialGenerator()
print("generator's random is \(generator.random())")
print("generator's random is \(generator.random())")

//MARK: Mutating Method Requirements 
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case Off, On
    mutating func toggle() {
        switch self {
        case On :
            self = Off
        case Off :
            self = On
        }
    }
}

var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()
lightSwitch.toggle()

//MARK: Initializer Requirements 
protocol InitializerProtocol {
    init(someParameter: Int)
}

class SomeClass: InitializerProtocol {
    required init(someParameter: Int) {
        
    }
}

class SuperClass {
    init(someParameter: Int) {
        
    }
}

class SubClass: SuperClass, InitializerProtocol {
    required override init(someParameter: Int) {
       super.init(someParameter: someParameter)
    }
}

//MARK: Protocol As Type
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())

for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}
//Delegation 
protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(game: DiceGame)
    func game(game: DiceGame, didStartNewTurnWithDictRoll dictRoll: Int)
    func gameDidEnd(game: DiceGame)
}

class SnakesAndladders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    
    init() {
        board = [Int](count: finalSquare + 1, repeatedValue: 0)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    var delegate: DiceGameDelegate?
    
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let dictRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDictRoll: dictRoll)
            switch square + dictRoll {
            case finalSquare :
                break gameLoop
            case let newSquare where newSquare > finalSquare :
                continue gameLoop
            default :
                square += dictRoll
                square += board[square]
            }
        }
       delegate?.gameDidEnd(self)
    }
    
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndladders {
            print("start a new game of snakes and Ladders")
        }
        
        print("The game is using a \(game.dice.sides) -sided dice")
        
    }
    
    func game(game: DiceGame, didStartNewTurnWithDictRoll dictRoll: Int) {
        ++numberOfTurns
        print("Rolled a\(dictRoll)")
    }
    
    func gameDidEnd(game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndladders()
game.delegate = tracker
game.play()

//MARK: adding Protocol Conformance with an Extension

protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice "
    }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print("\(d12.textualDescription)")

extension SnakesAndladders: TextRepresentable {
    var textualDescription: String {
        return "A game of sankes and ladders with \(finalSquare) squares"
    }
}
print(game.textualDescription)

//MARK: declaring Protocol Adoption with an Extension 
struct Hamster {
    var name: String
    
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}

extension Hamster: TextRepresentable { }

let simonHamster = Hamster(name: "simon")
let someTextRepresentable: TextRepresentable = simonHamster
print(someTextRepresentable.textualDescription)

//MARK: collections of Protocol Types
let things: [TextRepresentable] = [game, d12, simonHamster];

for textRepresentable in things {
    print(textRepresentable.textualDescription)
}

//MARK: Protocol Inheritance

protocol inheritancing: SomeProtocol, AnotherProtocol {
    
}

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

extension SnakesAndladders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0 :
                output += "▲"
            case let ladder where ladder < 0 :
                output += "▼"
            default :
                output += "o "
            }
        }
        return output
    }
}

print(game.prettyTextualDescription)

//MARK: Class-Only Protocol
protocol SomeInheritanceProtocol {
    
}

protocol someProtocolOnlyClass: class, SomeInheritanceProtocol {
    
}

//MARK: Protocol Composition
protocol Name {
    var name: String { get }
}

protocol Age {
    var age: Int { get }
}

struct Person2: Name, Age  {
    var name: String
    var age: Int
}

func wishHappyBrithday(celebrator: protocol<Name,Age>) {
    print("Happy Brithday \(celebrator.name) - you're \(celebrator.age)")
}

let brithdayPerson = Person2(name: "Malcolm", age: 21)

//Checking For Protocol conformance
protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415926
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}

class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

let objects: [AnyObject] = [
    Circle(radius: 3.0),
    Country(area: 243_610),
    Animal(legs: 4)
        ];
for object in objects {
    
    if let obj = object as? HasArea {
       print("Area is \(obj.area)")
    } else {
        print("something that doesn't have an area")
    }
}

//MARK: Optional Protocol Requirements

@objc protocol CounterDataSource {
    optional func incrementForCount(count: Int) -> Int
    optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    
    func increment() {
        if let amount = dataSource?.incrementForCount?(count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

class ThreeSource: NSObject, CounterDataSource {
    var fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()

for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

@objc class TowardsZeroSource: NSObject, CounterDataSource {
    func incrementForCount(count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TowardsZeroSource()

for _ in 1...5 {
    counter.increment()
    print(counter.count)
}

//MARK: Protocol Extensions

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

let generator2 = LinearCongruentialGenerator()

print("Here's a random number: \(generator2.random())")

print("And here is a random Bool: \(generator2.randomBool())")

//MARK: Providing Default Implementations

extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}

//MARK: Adding Constraints to Protocol Extensions
extension CollectionType where Generator.Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map {$0.textualDescription}
        return "[" + itemsAsText.joinWithSeparator(", ") + "]"
    }
}
let hamsters = [
    Hamster(name: "Murry"),
    Hamster(name: "Morgan"),
    Hamster(name: "Maurice")
]

print(hamsters.textualDescription)

