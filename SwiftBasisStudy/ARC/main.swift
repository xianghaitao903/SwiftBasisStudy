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

//MARK: - strong references Cycles for closures
//MARK: creating about
class HTMLElement {
    var name: String
    var text: String?
    
    lazy var asHTML: Void -> String = {
        if let text = self.text {
            return "<\(self.name)>\(self.text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialzed")
    }
    
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}

print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello world")
print(paragraph!.asHTML())
paragraph = nil

//MARK: Resolving Strong reference Cycles for closures

//MARK: defining a Capture List
class A {
    var delegate: Protocol?
    
    lazy var someClosures:(Int, String) -> String = {
    [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
//        closure body goes here
        return ""
    }
    
    lazy var otherClosures: Void -> String = {
        [unowned self, weak delegate = self.delegate!] () -> String in
        //        closure body goes here
        return ""
    }

}

//weak and unowned references 

class HTMLElement2 {
    var name: String
    var text: String?
    
    lazy var asHTML: Void -> String = {
       [ unowned self ] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(self.name) is being deinitized")
    }
    
}

var span: HTMLElement2? = HTMLElement2(name: "span", text: "hello world")
print(span!.asHTML())
span = nil
















