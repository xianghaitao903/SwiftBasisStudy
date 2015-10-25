//
//  main.swift
//  function
//
//  Created by 向海涛 on 15/10/25.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

//MARK: 有参数的 function
func sayHello(params: String) -> String {
    
    let greeting = "Hello, \(params) !"
    return greeting;
}
print(sayHello("Anna"));


func sayHellAgain(personName: String) -> String {
    
    return "Hello again, \(personName) !"
}


//MARK: 无参数的 function
func sayHelloWord() -> String {
    return "Hello Word"
}
print(sayHelloWord())



//MARK: 多个参数的function
func sayHello(personName: String, alreadyGreet: Bool) -> String {
    if alreadyGreet {
        return sayHellAgain(personName)
    } else {
        return sayHello(personName)
    }
}

print(sayHello("Anna", alreadyGreet: true))

//MARK: 没有返回参数的function
func sayGoodbye(personName: String) {
    print("Goodbye \(personName)")
}

sayGoodbye("Dave")

//MARK: function多个返回参数
func getMaxAndMinItemOfArray(array :[Int]) -> (max: Int,min: Int) {
    var maxItem = array[0]
    var minItem = array[0]
    for item in array[1..<array.count] {
        if item < minItem {
            minItem = item
        }
        if item > maxItem {
            maxItem = item
        }
    }
    
    return (maxItem,minItem);
}


let result = getMaxAndMinItemOfArray([2,4,2,45,6,1])

print("\(result) max is \(result.max)  min is \(result.min)")

//MARK: 返回可选参数（可能返回nil）的function
func minMax(array: [Int]) -> (max: Int,min: Int)?{
    if array.isEmpty { return nil}
    
    return getMaxAndMinItemOfArray(array)
}

if let bounds = minMax([1,2,3,45,221,223332232,-333]) {
    print(bounds)
}


//MARK: 参数名称 externalParameterName localParameterName
// func functionName(externalParameterName localParameterName: Type ,externalParameterName2 localParameterName2: Type)

func someFunction(firstParameterName: Int, secondParameterName:Int) {
    
}
someFunction(1, secondParameterName: 2)

func someFunction2(firstParameterName firstParameterName:Int, secondParameterName:Int){
    
}

someFunction2(firstParameterName: 3, secondParameterName: 5)

func sayHello2(to Person: String, and OtherPerson: String) {
    print("Hello \(Person) and \(OtherPerson)")
}
sayHello2(to: "Dave", and: "anna")

//MARK :如果不想现实第二个或者之后参数的externalParameterName 可以在前面加_ 

func someFunction3(firstParameter: Int, _ secondParameterName: Int) {
    
}

someFunction3(333, 444)

//MARK: 给参数设置默认值
func someFunction4(firstParamterName: Int = 9){
    print(firstParamterName)
}
someFunction4()

someFunction4(33)

//MARK: 传入可变个数的参数
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0;
    for number in numbers {
        total += number
    }
    return total/Double(numbers.count)
}
print(arithmeticMean(1,2,3,4,5))

print(arithmeticMean(2,3,4444.333,333))

//MARK: 设置参数位变量（避免在函数中重新定义变量，调用function 后 原来参数是不变的）
func alignRight(var string: String, totalLength: Int, pad: Character) -> String {
    if string.characters.count > totalLength {
        return string
    }
    
    let padString = String(pad)
    
    for _ in 1...(totalLength - string.characters.count) {
        string = padString + string
    }
    return string
}

var parameterName: String = "hello"

print("\(alignRight(parameterName,totalLength: 10,pad: "-"))")

print(parameterName)

//MARK: 传入function的参数是copy进入的，也就是调用function后 不会改变原来参数的值，如果需要改变则要将参数设置为In_Out类型的

func swapTwoInts(inout a: Int, inout b: Int) {
    let temporary = a
    a = b
    b = temporary
}

var parameter1 = 22
var parameter2 = 100
print("Before the function swapTwoInts executed, parameter1=\(parameter1)   parameter2 = \(parameter2)")
swapTwoInts(&parameter1, b: &parameter2)
print("After the function swapTwoInts executed, parameter1=\(parameter1)   parameter2 = \(parameter2)")

//MARK: Function Type

func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts

print("\(mathFunction(333,444))")


mathFunction = multiplyTwoInts

print(mathFunction(222,333))

//MARK: Function Types as parameter Types









