//
//  main.swift
//  ClassAndStructures
//
//  Created by 向海涛 on 15/10/29.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation
//MARK: Definition Syntax

class SomeClass {
//    
}

struct someStructures {
//    
}

struct Resolution {
    var width = 100.0
    var height = 150.0
}

class VidoModel {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

var someResolution = Resolution()

let someVidoModel = VidoModel()

print("the width of someResolution's width = \(someResolution.width)")

someVidoModel.resolution = someResolution

someResolution.width = 110

print("the width of someResolution's width = \(someResolution.width)")

print("someVidoModel.resolution.with is \(someVidoModel.resolution.width)")



let vgo = Resolution(width: 110.0, height: 200.0)

//MARK: structures and Enumerations are value type（赋值给另一个变量或者常量时是copy类型的)

var anotherResolution = someResolution

someResolution.width = 2000.0

print("anotherResolution.width is \(anotherResolution.width)")


//MARK: classes are reference types

let anotherVidoModel = someVidoModel
print("anotherVidoMpdel.frameRate is \(anotherVidoModel.frameRate)")

someVidoModel.frameRate = 1.0

print("anotherVidoMpdel.frameRate is \(anotherVidoModel.frameRate)")

//MARK: indentity Operators ===   和   !=== 

if someVidoModel === anotherVidoModel {
    print("some and anotherVidoModel are the same class")
}

//if someVidoModel == anotherVidoModel {   //报错
//    print("there")
//}


//let vido = VidoModel()

//MARK: String Array Dictionary 都为 value types







