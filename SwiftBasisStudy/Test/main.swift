//
//  main.swift
//  Test
//
//  Created by 向海涛 on 15/12/15.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

class Point {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int){
        self.x = x
        self.y = y
    }
}

class Machine {
    var location: Point
    
    init() {
        self.location = Point(x: 0, y: 0)
    }
    
    func move(direction: String) {
        print("Do nothing! I'm a machine!")
    }
}


class Robot: Machine {
    let isRobot: Bool = true
    
    override func move(direction: String) {
        switch direction {
        case "Up":
            location.x++
        case "Down":
            location.y--
        case "Right":
            location.x++
        case "Left":
            location.x--
        default:
            break
        }
    }
}

var robot = Robot();

robot.move("Up")
print(robot.location.x)


