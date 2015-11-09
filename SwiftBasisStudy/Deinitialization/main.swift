//
//  main.swift
//  Deinitialization
//
//  Created by 向海涛 on 15/11/9.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation
//MARK: 只有class才有deinitialization 方法 ，在class销毁时调用 deinit{}
print("Hello, World!")

class Bank {
    static var coinsInbank = 10_000
    
    static func vendCoins(var numbersOfcoinsTovend: Int) -> Int {
        
        numbersOfcoinsTovend = min(numbersOfcoinsTovend,coinsInbank)
        coinsInbank -= numbersOfcoinsTovend
        return numbersOfcoinsTovend
    }
    
    static func receiveCoin(coins: Int) {
        coinsInbank += coins
    }
}

class Player {
    var coinsInPures: Int
    init(coins: Int) {
        coinsInPures = Bank.vendCoins(coins)
    }
    
    func winCoins(coins: Int) {
        coinsInPures += Bank.vendCoins(coins)
    }
    
    deinit {
        Bank.receiveCoin(coinsInPures)
        print("deinit run ")
    }
}

var player:Player? = Player(coins: 1000)

print("a player join the game with \(player!.coinsInPures) coins")

print("now there has \(Bank.coinsInbank) coins in bank")


player?.winCoins(300)

print("now player has \(player!.coinsInPures) coins ")

print("now there has \(Bank.coinsInbank) coins in bank")

player = nil

print("now the bank has \(Bank.coinsInbank) left")








