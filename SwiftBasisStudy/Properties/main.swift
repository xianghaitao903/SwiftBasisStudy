//
//  main.swift
//  Properties
//
//  Created by 向海涛 on 15/11/2.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation


struct FixLengthRange {
    var firstValue: Int
    let length: Int
}
//MARK: struct 只要被标注为let 那么他的元素都不可以更改，无论是 var 还是let 声明的
let fixLengthRange = FixLengthRange(firstValue: 20, length: 21)

//fixLengthRange.firstValue = 30

//fixLengthRange.length = 30
//MARK: struct 只要被标注为var 那么标注为 var 的属性可以被更改 let的 不可以
var fixLengthRange2 = fixLengthRange

fixLengthRange2.firstValue = 30

//fixLengthRange2.length = 30

//MARK: Lazy Stored Properties 只有在使用的时候才会初始化
class dataImpoter {
    let fileName = "data.txt"
}

class dataManger {
    lazy var dataImpoter1 = dataImpoter()
    
    var data = [String]()
}

let manger = dataManger()

manger.data.append("some data")

manger.data.append("some more data")

print(manger.dataImpoter1.fileName)


//computed Properties

struct Point {
    var x: Float
    var y: Float
}

struct Size {
    var height,width: Float
}

struct Rect {
    var point = Point(x: 0.0, y: 0.0)
    var size = Size(height: 0.0, width: 0.0)
    var center:Point {
        get {
            let centerX = point.x + size.width / 2
            let centerY = point.y + size.height / 2
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            point.x = newCenter.x - size.width / 2
            point.y = newCenter.y - size.height / 2
        }
    }
}

var square = Rect(point: Point(x: 0, y: 0), size: Size(height: 10, width: 10))

let initialSquareCenter = square.center

square.center = Point(x: 15, y: 15)

print("square's point is \(square.point)")

//MARK: shortHand setter Declaration  set 方法没有写参数 会有一个默认的newValue

struct Rect2 {
    var point = Point(x: 0.0, y: 0.0)
    var size = Size(height: 0.0, width: 0.0)
    var center:Point {
        get {
            let centerX = point.x + size.width / 2
            let centerY = point.y + size.height / 2
            return Point(x: centerX, y: centerY)
        }
        set{
            point.x = newValue.x - size.width / 2
            point.y = newValue.y - size.height / 2
        }
    }
}

//MARK: read-only computed Properties 

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let cuboid = Cuboid(width: 2, height: 3, depth: 6)

print(cuboid.volume)

//MARK: properties Observers willSet 不带参数,默认为newValue didSet 不带参数,默认为oldValue

class StepCount {
    var totalSteps: Int = 0 {
        willSet {
            print("the totalStep will change to \(newValue) ")
        }
        
        didSet {
            print("the totalStep did change from \(oldValue)")
        }
    }
}

let stepCount = StepCount()

stepCount.totalSteps = 1

stepCount.totalSteps = 2

//MARK: Type properties (static)

struct SomeStruct {
    static var property1 = 12
    static var property2: Int{
        return 3
    }
}

var someStruct1 = SomeStruct()
SomeStruct.property1 = 14
print(SomeStruct.property1 + SomeStruct.property2)

enum SomeEnumeration {
    static var storedSomeTypeProperty = "Some Value."
    static var computedTypeproperty: Int {
        return 6
    }
}

SomeEnumeration.storedSomeTypeProperty = "another Value."
print(SomeEnumeration.computedTypeproperty)

class SomeClass {
    static var storedSomeTypeProperty = "Some Value."
    static var computedSomeTypeProperty: String {
        return "ssddsf"
    }
}

SomeClass.storedSomeTypeProperty = "another Value."
print(SomeClass.computedSomeTypeProperty)

//MARK: Querying and Setting Type Properties

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannel = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannel {
                AudioChannel.maxInputLevelForAllChannel = currentLevel
            }
        }
    }
}

var leftAudioChannel = AudioChannel()

leftAudioChannel.currentLevel = 7;

print("AudioChannel.thresholdLevel = \(AudioChannel.thresholdLevel) and AudioChannel.maxInputLevelForAllChannel = \(AudioChannel.maxInputLevelForAllChannel)")

var rightAudioChannel = AudioChannel()
rightAudioChannel.currentLevel = 20
print("AudioChannel.thresholdLevel = \(AudioChannel.thresholdLevel) and AudioChannel.maxInputLevelForAllChannel = \(AudioChannel.maxInputLevelForAllChannel)")
















