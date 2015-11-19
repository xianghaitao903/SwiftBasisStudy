//
//  main.swift
//  ErrorHanding
//
//  Created by 向海涛 on 15/11/19.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

//MARK: Representing and Throwing errors

enum VendingMachineError: ErrorType {
    case InvalidSelection
    case InsufficientFunds(CoinsNeeded: Int)
    case OutofStock
}

//throw VendingMachineError.InsufficientFunds(CoinsNeeded: 8)

struct Item {
    var prices: Int
    var count: Int
}

class VendingMachine {
    var inventroy = [
        "Candy Bar": Item(prices: 18, count: 12),
        "Chips": Item(prices: 11, count: 1),
        "pretzels": Item(prices: 1, count: 1)
        ]
    
    var coinsDeposite = 0
    
    func dispenseSnack(snak: String) {
        print("dispense \(snak)")
    }
    
    func vend(itemName name: String) throws {
        guard var item = inventroy[name] else {
            throw VendingMachineError.InvalidSelection
        }
        guard item.count > 0 else{
            throw VendingMachineError.OutofStock
        }
        guard item.prices <= coinsDeposite else {
            throw VendingMachineError.InsufficientFunds(CoinsNeeded: item.prices - coinsDeposite)
        }
        
        coinsDeposite -= item.prices
        --item.count
        inventroy[name] = item
        dispenseSnack(name)
        
    }
}

var favoriteSnack = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels"
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    
    let snackName = favoriteSnack[person] ?? "Cand Bar"
    try vendingMachine.vend(itemName: snackName)
    
}

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposite = 8

do {
    try buyFavoriteSnack("Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.InvalidSelection {
    
    print("Invalid selection")
} catch VendingMachineError.OutofStock {
    
    print("Out of stock")
} catch VendingMachineError.InsufficientFunds(let CoinsNeeded) {
    
    print("insufficient funds ,please insert an additional \(CoinsNeeded) coins")
}


//MARK: converting Errors to Option Values

func someThrowingFunction() throws -> Int {

    return 1
}

let x = try? someThrowingFunction()

// same meaning
let y: Int?

do {
    try y = someThrowingFunction()
} catch {
    y = nil
}

//MARK: sure Error will not happen

let xx = try! someThrowingFunction()

//MARK:specifying cleanup Actions  defer will execute will after do {} catch {} run
/*
func processFile(fileName: String) throws {
    if exists(fileName) {
        let file = openFile(fileName)
        
        defer {
            close(file)
        }
        
        while let line = try file.readLine() {
        
        }
    }
}
*/


