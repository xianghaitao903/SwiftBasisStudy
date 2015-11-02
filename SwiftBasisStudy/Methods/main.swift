//
//  main.swift
//  Methods
//
//  Created by 向海涛 on 15/11/2.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

class Count {
    var count = 0
    func increment() {
        count += 1
    }
    
    func incrementBy(ammount: Int) {
        count += ammount
    }
    
    func reset() {
        count = 0
    }
}

let counter = Count()
counter.increment()
print(counter.count)

counter.incrementBy(23)
print(counter.count)

counter.reset()
print(counter.count)


//MARK:Struct and enumerations are typeValue 要用func 改变它们的属性 要在加 func 前加 mutating 关键字
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
        self = Point(x: deltaX + x, y: deltaY + y)
    }
}
//MARK: 要声明为变量才可以修改
var somePoint = Point(x: 1, y: 2)
var anotherPoint = somePoint
anotherPoint.moveByX(3, y: 4)

print("\(somePoint)  and \(anotherPoint)")

let fixPoint = Point(x: 3, y: 9)
//fixPoint.moveByX(34, y: 45)

//MARK: mutating中可以使用self 

enum TriStateSwitch {
    case Low,Height,Off
    mutating func next() {
        switch self {
        case Off :
            self = Low
        case Low :
            self = Height
        case Height :
            self = Off
        }
    }
}

var ovenLight = TriStateSwitch.Low

ovenLight.next()
print(ovenLight)

ovenLight.next()
print(ovenLight)

//TYPE method

class SomeClass {
    class func someTypeMethod() {
        
    }
}
SomeClass.someTypeMethod()

struct LevelTracker {
    static var heighestUnlockedLevel = 1
    static func unlocalLevel(level: Int) {
        if level > heighestUnlockedLevel {
            heighestUnlockedLevel = level
        }
    }
    
    static func levelIsUnlocaled(level: Int) -> Bool {
        return level <= heighestUnlockedLevel
    }
    
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocaled(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var trackLevel = LevelTracker()
    let playerName: String
    func completedLevel(level: Int) {
        LevelTracker.unlocalLevel(level + 1)
        trackLevel.advanceToLevel(level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyirios")
player.completedLevel(1)
print("highest unlocaled level is now \(LevelTracker.heighestUnlockedLevel) ")

player = Player(name: "Beto")
if player.trackLevel.advanceToLevel(6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocal")
}






