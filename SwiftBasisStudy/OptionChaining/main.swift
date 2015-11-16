//
//  main.swift
//  OptionChaining
//
//  Created by 向海涛 on 15/11/16.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

class Person {
    var residence: Residence?
}

class Residence {
    var rooms = [Room]()
    var numbersOfRoom: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumbersOfRoom() {
        print("the numbers of rooms is \(numbersOfRoom)")
    }
    
    var address: Address?
}

class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var bulidingName: String?
    var bulidingNumber: String?
    var street: String?
    
    func bulidingIndentifier() -> String? {
        if bulidingName != nil {
            return bulidingName
        } else if bulidingNumber != nil && street != nil {
            return "\(bulidingNumber)\(street)"
        } else {
            return nil
        }
    }
}

let john = Person()
//MARK: accessing properties Through Optional chaining
if  let roomCount = john.residence?.numbersOfRoom {
    print("john's residence has \(roomCount) room(s). ")
} else {
    print("Unable to retrieve the numbers of rooms.")
}

let someAddress = Address()
someAddress.bulidingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress

//MARK: calling methods Through Option chaining
if john.residence?.printNumbersOfRoom() != nil {
    print("It is possible to print the number of rooms.")
} else {
    print("It is not possible to print the number of rooms.")
}

//MARK: accessing subscript Through Option chaining

if let firstRoomName = john.residence?[0].name {
    print("the first roomName is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room name.")
}

john.residence?[0] = Room(name: "bathRoom")

john.residence = Residence();
john.residence?.rooms.append(Room(name: "Living Room"))

//MARK: accessing subscript of Option Type

var textScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]

textScores["Dave"]?[0] = 91
textScores["Bev"]?[0]++
textScores["Brian"]?[0] = 72

//MARK: linking Multiple Levels of Chaining

if let johnStreet = john.residence?.address?.street {
    print("john's street name is \(johnStreet)")
} else {
    print("Unable to retrieve the address")
}

let johnAddress = Address()
johnAddress.bulidingName = "The Larches"
johnAddress.bulidingNumber = "Laurel Street"
john.residence?.address = johnAddress

if let streetName = john.residence?.address?.street {
    print("john's street name is \(streetName)")
} else {
    print("Unable to retrieve the street")
}

//MARK: chaining on Methods with Optional Return Values

if let bulidingIndentifier = john.residence?.address?.bulidingIndentifier() {
    print("john's buliding indentifier is \(bulidingIndentifier)")
}

if let beginWithThe = john.residence?.address?.bulidingIndentifier()?.hasPrefix("The") {
    if beginWithThe {
        print("john's buliding indentifier begins with \"The\"")
    }
}





