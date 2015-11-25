//
//  main.swift
//  AccessControl
//
//  Created by 向海涛 on 15/11/25.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

//MARK: Access Control Syntax
public class SomePublicClass {}
internal class SomeInternalClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
private func somePrivateFunction() {
    
}

//MARK: Custom Types
public class OnePublicClass {
    public let a = 0
//    public class member
    
    var b = "21"
//    internal class member
    
    private func function() {
//     private class function
    }
//  can use public ,internal and private
}

class OneInternalClass {
//    public let a = 0
//    can not use public
    
    var bb = "22"
//    internal class member
    
    private func function() {
//        private class member
    }
//    can not use public
}

private class OnePrivateClass {
    var somePrivateProperty = 0
//    all properties and functions are private, internal also means private, And can not use public
    func aa() {
//        private func
    }
}

//MARK: Function Type 
/* because the result type is private, the function must be private too
private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    
}
*/

//MARK: Enumerations Types
public enum CompassPoint {
    case North
    case West
    case East
    case South
}

//MARK: SubClassing

public class A {
    private func myFunction() {
        
    }
}

class B: A {
    override internal func myFunction() {
        super.myFunction()
    }
}

//MARK: getters And setters
public struct TrackString {
    private(set) var numbersOfEdits = 0
    public private(set) var counts = 0;
    var value: String = "" {
        didSet {
            ++numbersOfEdits
        }
    }
}

var stringToEdit = TrackString()
stringToEdit.value = "a"
stringToEdit.value += " b"
stringToEdit.value += " c"
print(stringToEdit.numbersOfEdits)





