//
//  main.swift
//  Closure
//
//  Created by 向海涛 on 15/10/27.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

//MARK: Closure  sort
var arr = ["Chirs","Ewa","Alex","Barry","Daniella"]

func backWards(s1: String, _ s2: String) -> Bool {
    print("\(s1)  and  \(s2)")
    return s1 > s2
}

print("arr == \(arr)")
var reversed = arr.sort(backWards)
print(reversed)

arr = arr.sort()
print("arr == \(arr)")
reversed = arr.sort({(s1: String, s2: String) -> Bool in print("\(s1) and \(s2)"); return s1 > s2})
print(reversed)

arr = arr.sort()
print("arr == \(arr)")
reversed = arr.sort({s1, s2 -> Bool in print("\(s1) and \(s2)");  return s1 > s2})
print(reversed)




