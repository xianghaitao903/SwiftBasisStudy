//
//  main.swift
//  ControlFlow
//
//  Created by 向海涛 on 15/10/20.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation
//MARK:流程控制

//MARK: for index in 1...5
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//MARK: 不需要循环范围里面的值， 使用 _ 代替

let base = 3

let power = 10

var answer = 1

for _ in 1...power {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")

//MARK:传统的循环
for index in 0 ..< 3 {
    print("index is \(index)")
}

var index :Int
for index = 0;index < 3;index += 1 {
    print("index is \(index)")
}

print("The loop statements were execute \(index) times")

//MARK: - while Loops

let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)

board[03] = +08
board[06] = +11
board[09] = +09
board[10] = +02

board[14] = -10
board[19] = -11
board[22] = -02
board[24] = -08

var square = 0
var diceRoll = 0
while square < finalSquare {
    if ++square == 7 {square = 1}
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
    
}

print("game over")
//MARK: repeat { ...} while
repeat {
    square += board[square]
    if ++square == 7 {square = 1}
    square += diceRoll
} while square < finalSquare

print("game over")

