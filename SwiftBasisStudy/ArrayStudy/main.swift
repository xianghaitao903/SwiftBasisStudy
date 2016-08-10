//
//  main.swift
//  ArrayStudy
//
//  Created by 向海涛 on 15/10/15.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

// MARK:  数组初始化
var StringArr: [String] = ["123","456","abc"];

var StringArr2: Array<String> = ["abe","a","c"];

var StringArr3 = ["","","",];

var someInts = [Int]();
someInts.append(3);

someInts = []

var threeDouble = [Double](count: 3, repeatedValue: 0.0)

//print(threeDouble)

threeDouble.append(0.4);

//var aaa =  threeDouble[6]

//print(threeDouble)

var foreInt = Array(count: 4, repeatedValue: 3)
//foreInt[5] = 10;
foreInt.append(6);

// MARK: - 数组声明
var intArr: [Int];

var doubleArr: [Double];

var floatArr: [Float];

var dictionary: Array<Dictionary<String,String>>;

var dictionary2: [Dictionary<String,Int>];

var StringArrLength = StringArr.count;

if StringArr.isEmpty {
    //print("StringArr is Empty")
} else {
    //print("StringArr is not Empty");
}
//MARK: - 修改元素的方法
//MARK:增加元素
StringArr.append("789");

//print("StringArr's length is \(StringArrLength) before append a item and is \(StringArr.count) after append")

StringArr += ["111","67"];

//print(StringArr);

var firstItem = StringArr[0];

//MARK:修改单个元素


StringArr[0] = "1"

//print(StringArr);
//MARK:批量修改区间段的元素
StringArr[2...4] = ["1","4","4","5"]

//print(StringArr)

//MARK:特定位置插入
StringArr.insert("xxx", atIndex: 0)

//print(StringArr)
//MARK:特定位置移出
let removeString = StringArr.removeAtIndex(2);

//print("After remove \(removeString) new Arr is \(StringArr)" )

//MARK: - Array指针地址测试 与OC不同
var newArr = StringArr

//print("newArr is \(newArr)")

StringArr[0...3] = ["23"]

//print("while StringArr changed, newArr is \(newArr)")

//MARK:另一种方式测试

var oldArray = [Int]();

var newArray = oldArray;

//print(newArray)

oldArray.append(4);

//print("newArray === \(newArray)  old Arr === \(oldArray)")


//MARK: - 类指针地址测试 与OC相同
class Person {
    var age: Int?;
    var sex: String?;
}

var person = Person();

person.age = 12;

person.sex = "male"

var person2 = person

//print(person2.sex!)

person.sex = "female"

//print(person2.sex!)

//MARK: - Array遍历
for items in StringArr {
    //print(items);
}

for (index,value) in StringArr.enumerate() {
    //print("the value is \(value) at the index \(index) of StringArr");
}


var arr :Array<Int> = [12,12,111];

print("\(arr[0])");


