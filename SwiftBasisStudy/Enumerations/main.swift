//
//  main.swift
//  Enumerations
//
//  Created by 向海涛 on 15/10/28.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

//MARK: 初始化
enum SomeEnumerations {
    
}

enum Compasspoint {
    case North
    case South
    case East
    case Wast
}

enum Plante {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

var directionToHead = Compasspoint.North

directionToHead = .Wast

switch directionToHead {
case .North:
    print("Lots of plantes have a North")
case .South:
    print("watch out for penguins")
case .East:
    print("where the sun rises")
case .Wast:
    print("where the skies are blue")
}

switch directionToHead {
case .East:
    print("where the sun rises")
default:
    print("Not the East")
}

//MARK: case can store different types

enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRcode(String)
}

var productBarcode = Barcode.UPCA(10, 12, 13, 14)

//productBarcode = .QRcode("1234")

switch productBarcode {
case .UPCA(let numberSystem, let manuacturer, let product, let check):
    print("UPC-A \(numberSystem), \(manuacturer), \(product), \(check)")
case .QRcode(let productName):
    print(productName)
    
}

// 如果都为变量，或者都为常量可以只在最前面加一个var 活着let 

productBarcode = .QRcode("1234")
switch productBarcode {
case let .UPCA(a, b, c, d):

    print(a + b + c + d)
case var .QRcode(aa):
//    code
    print(aa)
    aa = "123455"
    print(aa)
    print(productBarcode)
}

//MARK: Raw Value 类型可以为 String Character Integer number .. 每一个case 必须唯一

enum ASCIIControlCharacter:Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

//MARK: Implicitly Assigned Raw Valew

//Int 型 如果只给第一个值，其他值会依次类推，第二个为第一个加一， 都不给值，第一个默认为0
enum Plante2: Int {
    case Merury = 1, Venus, Earth, Mars
}

//String 型 不设初值 第一个值为 “North” 后面依次类推
enum Compass2: String {
    case North, Wast, East, South
}

//Initializing from a Raw Value

//possiblePlante 为Plante2 类型 并根据 rawValue 没有找到匹配项则为空
var possiblePlante = Plante2(rawValue: 7)
print(possiblePlante)
possiblePlante = Plante2(rawValue: 2)
print(possiblePlante!)

//MARK: Recurive Enumerations 递归Enum case 中的元素可以把 其他元素活着本身当作参数
enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}
//或者这样定义
indirect enum ArithmeticExpression2 {
    case Number(Int)
    case Addition(ArithmeticExpression2,ArithmeticExpression2)
    case Multiplication(ArithmeticExpression2,ArithmeticExpression2)
}

func evaluate(expression: ArithmeticExpression) -> Int {
    
    switch expression {
    case .Number(let value) :
        return value
    case .Addition(let left, let right) :
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right) :
        return evaluate(left) * evaluate(right)
    }
}

let five = ArithmeticExpression.Number(5)
let six = ArithmeticExpression.Number(6)
let sum = ArithmeticExpression.Addition(five, six)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(8))

print(evaluate(product))






















