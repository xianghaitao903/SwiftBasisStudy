//
//  main.swift
//  Inheritance
//
//  Created by 向海涛 on 15/11/2.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

//MARK: Subclass
class Vehicle {
    var currentSpeed = 0.0
    
    var description: String {
       return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        print("superClass makeNoise run")
    }
}

class SomeSubclass: Vehicle {
    var hasBasket = true
}

let vehicle = Vehicle()
print(vehicle.description)
vehicle.currentSpeed = 22
vehicle.makeNoise()

let someSubclass = SomeSubclass()
someSubclass.currentSpeed = 23
print(someSubclass.description)
someSubclass.makeNoise()

//MARK: Overriding
class Train: Vehicle{
    override func makeNoise() {
        print("subclass's makeNoise run ")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear) "
    }
}

let car = Car()
car.currentSpeed = 30
print(car.description)

//MARK: preventing overriding
class SuperClass {
    final var property = 0;
    
    final func finalFunc() {
        
    }
}







