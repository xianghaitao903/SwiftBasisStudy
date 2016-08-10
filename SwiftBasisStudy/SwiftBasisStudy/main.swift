//
//  main.swift
//  SwiftBasisStudy
//
//  Created by 向海涛 on 15/10/14.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

//Basic SourceType and init

var a :String? = nil;

let defaultName :String = "ss";
print("a deafult value is \(a ?? defaultName)");
a = "aa"
print("a deafult value is \(a!)");

/** 多行注释中套多行注释
 /**
      注释
 */
 */

let intNumber :Int = 12;

var doubleNumber :Double = 12.0;

var doubleNumber1,doubleNumber2 :Double

////print(doubleNumber1 + doubleNumber2)

var floatNumber :Float = 12.0;

var simpleString :String = "123";

let aaa = Int(simpleString);
print(aaa);

let sString = String(aaa)
print(sString)

var Arr :Array<String> = ["123","456","789"];

var Arr2 :[String] = ["2221","222121"];

var dict :Dictionary<String,String> =  ["key1": "value1","key2": "value2"]

let newArr : [Int] = Arr.map({ (item: String) -> Int in
  let intValue :Int? = Int(item);
  return intValue ?? 0;
});

typealias AudioSample = UInt16;
print(AudioSample.min);


let http404Code = (404,"Not Found");
let (statusCode, statusMessage) = http404Code;
print("http Code \(statusCode) means \(statusMessage)")
print("http Code \(http404Code.0) means \(http404Code.1)")

let b = (statusCode :200, description: "OK");
print("http Code \(b.statusCode) means \(b.description)")


var aa :String? = "sss"

print(aa);
print(aa!);
print(aa ?? "xxx")
aa = nil;
print(aa ?? "xxx")

//
//let myArryStudy = ArrayStudy();
////print(myArryStudy.array);


