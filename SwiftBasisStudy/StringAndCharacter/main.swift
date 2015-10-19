//
//  main.swift
//  StringAndCharacter
//
//  Created by 向海涛 on 15/10/16.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

//MARK:  初始化空String

var emptyString = ""

var anotherEmptyString = String()

if emptyString.isEmpty && anotherEmptyString.isEmpty {
    //print("emptyString and anotherEmptyString are both empty")
}

//MARK: 遍历String 中的Character
var variableString = "horse"

variableString += " and carriage😵"

for character in variableString.characters {
    //print(character)
}

//MARK:通过Character 数组初始化String
let characters :[Character] = ["a"," ","d","o","g"," ","i","s"," ","l","i","k","e"," ","🐕"]

let myString = String(characters)

//print(myString)

//MARK:在String后面append一个字符
let exclamationMark :Character = "🌳"

variableString.append(exclamationMark)

//print(variableString)

//MARK: 在String后面appendContentOf 一个String
variableString.appendContentsOf("ssss")

//print(variableString)

//MARK:不同类型的数据拼接成String
let multiplier = 3

var message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

//print(message)

var message2 = String(multiplier) + " times 2.5 is " + String(Double(multiplier) * 2.5)

//print(message2)

//MARK: - String中的特殊字符
var unicodeString = "\\0 is \0 sss \\n is \n \\t is \t  \" \'  \u{24} "

//print(unicodeString)

var word = "12334"

//print(word.characters.count)

let line :Character = "\n"

word.append(line)

//print("\(word) count is \(word.characters.count)")

//MARK: - 获取String特定位置的Character
let greeting = "Guten Tag!"

//print(greeting[greeting.startIndex])
//MARK: predecessor() 后移一位 ，
//endIndex   后移一位才是最后一位字符串
//print(greeting[greeting.endIndex.predecessor()])


//MARK: successor()前移一位
//print(greeting[greeting.startIndex.successor()]);

//MARK: advancedBy()
//从最开始偏移七个位置，是第8位
let location = greeting.startIndex.advancedBy(7)

//print("\(greeting)======\(greeting[location])")
//MARK:通过位置遍历
for index in greeting.characters.indices {
    //print("\(greeting[index])   ", terminator: "")
}

//MARK: - 特定位置插入或者移除字符

var welcome = "hellow"

//MARK:插入字符
welcome.insert("!", atIndex: welcome.endIndex)

//print(welcome)

//MARK:插入字符串

welcome.insertContentsOf(" everyone".characters, at: welcome.endIndex.predecessor())
//print(welcome)

//MARK:移除字符

welcome.removeAtIndex(welcome.endIndex.predecessor())

//print(welcome)

//MARK:移除特定位置的字符串
welcome.removeRange(welcome.endIndex.advancedBy(-6)..<welcome.endIndex)

//print(welcome)

//MARK: 截取字符串
var newSubstring = welcome.substringFromIndex(welcome.startIndex.advancedBy(1))

//print(newSubstring);

welcome = "\(welcome) sss PPPP ssss"
//rangeOfString(" ")获取的是字符串中第一个空格的位置
let range = welcome.rangeOfString(" ")
//print("\(welcome) range ===  \(range!) ")

let range2 = Range(start: welcome.startIndex, end: welcome.endIndex.predecessor())

//print("rang2 = \(range2)")

newSubstring = welcome.substringToIndex(welcome.startIndex.advancedBy(5))
//print(newSubstring)

newSubstring = welcome.substringWithRange(range2)
//print(newSubstring)

let subArr = welcome.componentsSeparatedByString(" ")
//print(subArr)

let replaceString = welcome.stringByReplacingOccurrencesOfString(" ", withString: "  ")
//print("replaceString = \(replaceString)")

//MARK: - 前缀与后缀hasPrefix(),hasSuffix()

var prefixAndsuffixArr = [
    "AAA BBB end cell",
    "AAA BBB start cell2",
    "CCC BBB start2 cell",
    "CCC BBB start3 cell",
    "AAA BBB start4 cell1"
]
var prefixCount:Int = 0
var suffixCount:Int = 0

for items in prefixAndsuffixArr {
    if items.hasPrefix("AAA BBB"){
        //print(items)
        prefixCount++
    }
    if items.hasSuffix(" cell"){
        //print(items)
        suffixCount++
    }
}

//print("prefixAndSuffixArr has \(prefixCount) items like \"AAA BBB***\" and \(suffixCount) items like \"**** cell\"");

//MARK: - unicode reprecentations of string

let dogString = "dog!🐶"

for codeUnit in dogString.utf8 {
    //print("codeUnit :\(codeUnit)",terminator: "     ")
}







