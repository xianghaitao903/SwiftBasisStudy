//
//  main.swift
//  Set
//
//  Created by 向海涛 on 15/10/18.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

/*  当元素不重要，或者只出现一次时使用SET
 *  其他情况使用Array
 */


import Foundation

//MARK: 初始化
var letters = Set<Character>()

//print("letters is of type Set<Character>  with \(letters.count) items ");

letters.insert("a")
letters.insert("a");
//letters = [] 后letters 为空

print(letters);
letters = ["a","b","a"];
print(letters);

var favoriteGenres: Set<String> = ["Rock","classical","Hiphop"]

if favoriteGenres.isEmpty {
    //print("As far as music goes,I'm not picky")
} else {
    
    //print("I have particual music perferences")
}
//MARK :remove("Jazz")
favoriteGenres.insert("Jazz")

if let items = favoriteGenres.remove("Jazz") {
    //print("favoriteGenres has removed Jazz")
}

if let items = favoriteGenres.remove("Jazz") {
    //print("favoriteGenres does not have the items Jazz")
}

//favoriteGenres.removeAll()

if favoriteGenres.isEmpty {
    //print("favoriteGenres has removed all its items")
}
//MARK :contains("Funk")
if favoriteGenres.contains("Funk") {
    //print("I get up on the good foot.")
} else {
    //print("It is too funky here.")
}
//MARK :遍历
//无序输出
for item in favoriteGenres {
    //print(item)
}
//有序输出
for item in favoriteGenres.sort() {
    //print(item)
}
//MARK: - 集合操作取交集,合集，并集，差集
var a :Set = ["aaa","bbb","ccc"]
var c :Set = ["bbb","ccc","ddd"]

var d = a.intersect(c);
//print(d)

var e = a.exclusiveOr(c)
//print(e)

var f = a.union(c)
//print(f)

var g = a.subtract(c)
//print(g)

//MARK: - 集合与集合间的关系
let oddDigist :Set = [1,2,3,4];

let evenDigist :Set = [1,2,3,4,5,6,7]

let singelDigist :Set = [5,6,7]

let sameDigist :Set = [4,3,2,1]

let oneSet :Set = [6,5]

if oddDigist == sameDigist {
    //print("oddDigist and sameDigist contain all of the same values")
}

if oddDigist.isSubsetOf(evenDigist) {
    //print("all the Values of oddDigist are contained by evenDigist")
}

if evenDigist.isSupersetOf(singelDigist) {
    //print("evenDigist contains all the values that singelDigist contains")
}

if sameDigist.isStrictSubsetOf(oddDigist) {
    //print("sameDigist is subsetof oddDigist but not equal to oddDigist")
}

if oneSet.isDisjointWith(oddDigist) {
    //print("oneSet and oddDigist have no values in common")
}








