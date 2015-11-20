//
//  main.swift
//  Extensions
//
//  Created by 向海涛 on 15/11/20.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

//MARK: Extensions Syntax 
/*
extension someType {
    
}

extension someType: someProtocol, AnotherProtocol {

}
*/

//MARK: computed Properties

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.5.mm
print("One inch is \(oneInch)")
let aMarathon = 42.km + 195.m
print(aMarathon)

//MARLK: Initialzers

struct Size {
    var height = 0.0, width = 0.0
}

struct Point {
    var centrX = 0.0, centrY = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(centrX: 11.1, centrY: 11.2), size: Size(height: 5.0, width: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.centrX - (size.width / 2)
        let originY = center.centrY - (size.height / 2)
        
        self.init(origin: Point(centrX: originX, centrY: originY), size: size)
    }
}

let centerRect = Rect(origin: Point(centrX: 4.0, centrY: 4.0), size: Size(height: 3.0, width: 3.0))

//MARK: Method 

extension Int {
    func repetition(trask: () -> Void) {
        for _ in 0..<self {
            trask()
        }
    }
}

3.repetition { () -> Void in
    print("hello!")
}

//MARK: mutating Instance Methods (Method change self Value)
extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3;
someInt.square()
print(someInt)

//MARK: subscripts 

extension Int {
    subscript(var index: Int) -> Int {
        var decimalBase = 1
        while index > 0 {
           decimalBase *= 10
            --index
        }
        return (self / decimalBase) % 10
    }
}
print(987654321[4])

//MARK: Nested Type 

extension Int {
    enum Kind {
        case Nagetive, Zero, Positive
    }
    
    var king: Kind {
        switch self {
        case 0 :
            return .Zero
        case let x where x > 0 :
            return .Positive
        default :
            return .Nagetive
        }
    }
}

func printIntegerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.king {
        case .Nagetive :
            print("-", terminator: "")
        case .Zero :
            print("0", terminator: "")
        case .Positive :
            print("+", terminator: "")
            
        }
    }
}

let numbers = [-222, 0, 2222, 233]

printIntegerKinds(numbers)



