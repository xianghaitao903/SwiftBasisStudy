//
//  main.swift
//  Generics
//
//  Created by 向海涛 on 15/11/24.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation
//MARK: The Problem That Generics Solve

func swapTwoInts(inout a: Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 12
var anotherInt = 13
swapTwoInts(&someInt, &anotherInt)
print("someInt now is \(someInt), anotherInt now is \(anotherInt)")

func swapTwoStrings(inout a: String, inout _ b: String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoDoubles(inout a: Double, inout _ b: Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

//MARK: Generics Function

func swapTwoValues<T>(inout a: T, inout _ b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

swapTwoValues(&someInt, &anotherInt)
print("someInt now is \(someInt),anotherInt now is \(anotherInt)")

//MARK: Type parameters
/*
func someFunction<T,B>() {
}
T B are type parameters someFunction can user as parameters , return Type or use in its body
*/

//MARK: Generics Types

struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(e: Element) {
        items.append(e)
    }
    
    mutating func pop() -> Element {
       return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

let fromTheTop = stackOfStrings.pop()

//MARK: Extension a Generics Type

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil: items.last
    }
}

if let topItem = stackOfStrings.topItem {
    print("The top item of stackOfStrings is \(topItem)")
}

//MARK: Type Constraints 
/*
func someFunction<T: someClass, U: someProtocol>(someT: T, someU: U) {
    
}
*/

func findStringIndex(array: [String], _ valueToFind: String) -> Int?{
    for (index, value) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let strings = ["cat", "dog", "llama", "parakeet"]

if let index = findStringIndex(strings, "llama") {
    print(index)
}

func findIndex<T: Equatable>(array: [T], _ valueToFind: T) -> Int? {
    for (index, value) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let doubleIndex = findIndex([21.0, 22.0, 222.2], 333.3)
let stringIndex = findIndex(["aa", "bb", "cc"], "cc")

//MARK: Associated Types 

protocol Container {
    typealias ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct IntStack: Container{
    var items = [Int]()
    
    mutating func push(item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    typealias ItemType = Int
    
    mutating func append(item: Int) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct Stack2<Element>: Container {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    mutating func append(item: Element) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
}

extension Array: Container {}

//MARK: Where Clauses

func allItemMatch<C1: Container, C2: Container where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>
    (someContainer: C1, _ anotherContainer: C2) -> Bool {
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        for i in 0..<someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        
        return true
}

var stringsOfStack = Stack2<String>()
stringsOfStack.push("aa")
stringsOfStack.push("bb")
stringsOfStack.push("cc")

var arrayOfString = ["aa", "bb", "cc"]

if allItemMatch(stringsOfStack, arrayOfString) {
    print("stringsOfStack and arrayOfString all items match")
}



