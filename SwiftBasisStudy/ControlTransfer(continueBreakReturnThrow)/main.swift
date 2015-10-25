//
//  main.swift
//  ControlTransfer(continueBreakReturnThrow)
//
//  Created by 向海涛 on 15/10/21.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

//MARK: continue

let puzzleInput = "great minds think alike"

var puzzleOutput = ""

for character in puzzleInput.characters {
    
    switch character {
    case "a","e","i","o","u"," " :
        continue
    default :
        
        puzzleOutput.append(character)
    }
    
}

print(puzzleOutput)

//MARK:break
let numberSymbol :Character = "s"
var possibleIntegerValue: Int?

switch numberSymbol {
case "1","一" :
    possibleIntegerValue = 1
case "2","二" :
    possibleIntegerValue = 2
case "3","三" :
    possibleIntegerValue = 3
default :
    break
}

if let integerValue = possibleIntegerValue {
    print("the integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value counld not found for \(numberSymbol).")
}

//MARK: fallthrough 跳到当前case的下一条

let integerTodescribe = 5

var description = "the number \(integerTodescribe) is "

switch integerTodescribe {
case 2,3,5,7 :
    description += "a prime number, and also "
    fallthrough
case 4,6 :
    description += "an "
    fallthrough
default :
    description += "integer"
}

print(description)


//MARK:labeled statements 标记循环，然后在循环里面使用 break 跳出 ，continue 继续

gameLoop: for i in 1...4 {
    if i == 3 {
        print(i)
        break gameLoop
    } else {
        print("ss")
        continue gameLoop
    }
}

var i = 2
var case1 = 0
var case11 = 0
var case77 = 0
var case99 = 0

gameLoop: while ++i < 100 {
    
    switch i {
    case 1:
        i = 11
        case1 += 1
    case 11,22,33,44,55,66 :
        i += 11
        case11 += 1
    case 77:
        case77 += 1
        continue gameLoop
    case 99 :
       break gameLoop
    default :
        case99 += 1
        break
    }
    
}

print("\(case1)    \(case11)   \(case77)    \(case99)")


//MARK: available

if #available(OSX 22, *) {
    print("Use iOS API on iOS  ")
} else {
    print("")
}


