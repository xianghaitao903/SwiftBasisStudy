//
//  main.swift
//  NestedType
//
//  Created by 向海涛 on 15/11/20.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

struct BlackJackCard {
    
    enum Suit: Character {
        case Spades = "♠︎" , Hearts = "♥︎", diamonds = "♦︎", Clubs = "♣︎"
    }
    
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        struct Values {
            let first: Int, second: Int?
        }
        
        var value: Values {
            switch self {
            case .Ace :
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King :
                return Values(first: 10, second: nil)
            default :
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    let rank: Rank, suit: Suit
    
    var description: String {
        var out = "suit is \(suit.rawValue),"
        out += "value is \(rank.value.first),"
        if let second = rank.value.second {
            out += "or \(second)"
        }
        return out
    }
    
}

let theAceOfSpades = BlackJackCard(rank: .Ace , suit: .Spades)

print(theAceOfSpades.description)

let heartsSymbol = BlackJackCard.Suit.Hearts.rawValue







