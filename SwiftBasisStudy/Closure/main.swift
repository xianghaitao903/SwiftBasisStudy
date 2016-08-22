//
//  main.swift
//  Closure
//
//  Created by 向海涛 on 15/10/27.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

//MARK: Closure  sort
var arr = ["Chirs","Ewa","Alex","Barry","Daniella"]

func backWards(s1: String, _ s2: String) -> Bool {
        return s1 > s2
}

//print("arr == \(arr)")
var reversed = arr.sort(backWards)
//print(reversed)

//arr = arr.sort()
//print("arr == \(arr)")
reversed = arr.sort({(s1: String, s2: String) -> Bool in  return s1 > s2})
//print(reversed)

//arr = arr.sort()
//print("arr == \(arr)")
reversed = arr.sort({s1, s2 -> Bool in return s1 > s2})
//print(reversed)

//print("arr == \(arr)")
reversed = arr.sort({$0 > $1})
//print(reversed)

//print("arr == \(arr)")
reversed = arr.sort {$0 > $1}
//print(reversed)




//MARK: Trailing Closure
func someFunctionThatTakesAclosure (closure: () -> Void) {
    
}

 someFunctionThatTakesAclosure { () -> Void in
//    <#code#>
    //print("123")
}

someFunctionThatTakesAclosure(){
//    code
    //print(456)
}

let digitNames = [0: "zero", 1: "one", 2: "two", 3: "three", 4: "four", 5: "five", 6: "six", 7: "seven", 8: "eight", 9: "nine"]

let numbers = [16, 58, 150]

let string = numbers.map {
(var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output;
        number /= 10
    }
    return output
}

//print(string)

//MARK: Captururing Values

func makeIncrementer(forIncrementer amount: Int) -> () -> Int {
    var runningTotal = 0
    func inCrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
  return inCrementer
}

let incrementByTen = makeIncrementer(forIncrementer: 10)

print(incrementByTen())

print(incrementByTen())

let incrementBySeven = makeIncrementer(forIncrementer: 7)

print(incrementBySeven()) //7

print(incrementBySeven())  //14

//MARK: closures are reference Types

let alsoIncrementByTen = incrementByTen

//print(alsoIncrementByTen())

//MARK: autoClosures clocure @autoclosure只能够在内部执行，不能escape到外面

var customersInline = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

let customerProvider = {customersInline.removeAtIndex(0)}

print(customersInline.count)

print(customerProvider())

print(customersInline.count)

func serverCustomer (customer: () -> String) {
    print("Now serving \(customer())!")
}

serverCustomer( {customersInline.removeAtIndex(0)} )

print("customersInline == \(customersInline)")

var mycustomer: () -> String = ({return ""})

func serverCustomerAuto(@autoclosure customer: () -> String) {
    print("Now serving \(customer())!")
  //  mycustomer = customer //此句会报错  customer不能够跑到外面去执行
}

serverCustomerAuto( customersInline.removeAtIndex(0) )

print("customersInline == \(customersInline)")

//MARK: 使用@autoclosure(escaping) 声明则可以escape到外面

func serverCustomerAutoEscaping(@autoclosure(escaping) customer: () -> String) {
    print("Now serving \(customer())!")
    mycustomer = customer // customer够跑到外面去执行
}

serverCustomerAutoEscaping(customersInline.removeAtIndex(0))

print("\(mycustomer())")










