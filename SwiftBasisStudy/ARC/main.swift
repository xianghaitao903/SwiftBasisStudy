//
//  main.swift
//  ARC
//
//  Created by 向海涛 on 15/11/9.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

//MARK:ARC in action 

class Person {
    let name: String
    
    init(name: String){
        self.name = name
        print("\(name) is initializationed")
    }
    
    deinit {
        print("\(name) is deinitialization")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "Johin Appleseed")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil

//MARK: Strong Reference cycles Between Class Instances

class Person2 {
    let name: String
    var apartment:Apartment?
    
    init(name: String) { self.name = name }
    
    deinit {
        print("\(name) deinitialtization ")
    }
    
}

class Apartment {
    let unit: String
    var person: Person2?
    
    init(unit:String) { self.unit = unit }
    
    deinit {
        print("\(unit) deinitialtization")
    }
}

func seeCycleReference() {
var john: Person2?
var unit4A: Apartment?

john = Person2(name: "john")
unit4A = Apartment(unit: "unit4A")

john!.apartment = unit4A
unit4A!.person = john

john = nil
unit4A = nil
}

seeCycleReference()
//MARK: - resolving strong reference cycles between Class Instances

//MARK: weak References  Both class can be nil

/*
class Apartment2 {
    let unit: String
    weak var person: Person2?
    
    init(unit:String) { self.unit = unit }
    
    deinit {
        print("\(unit) deinitialtization")
    }
}
seeCycleReference()

*/

//MARK: unowned References alternative class can be nil

/*
class Apartment2 {
let unit: String
unowned var person: Person2?

init(unit:String) { self.unit = unit }

deinit {
print("\(unit) deinitialtization")
}
}
seeCycleReference()
*/

//MARK: unowned References and Implicitly Unwrapped Optional Properties  both class can not be nil

class Country {
    let name: String
    var capitalCity: City!
    
    init(name: String, capitalName: String) {
        self.name = name;
        self.capitalCity = City(name: name, country: self)
    }
    
}

class City {
    let name: String
    unowned let country: Country
    
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}













