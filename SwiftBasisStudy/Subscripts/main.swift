//
//  main.swift
//  Subscripts
//
//  Created by 向海涛 on 15/11/2.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation
//MARK: subscript read-write  read-only
//read-write
/**
subscript(index: Int) {
    get {
        
    }
    set {
        
    }
}*/
//read-only
/**
subscript(index: Int) {
    
}
*/
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return index * multiplier
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("6 times three is \(threeTimesTable[6])")

//MARK: subscript Options

struct Matrix {
    let row,columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        row = rows
        self.columns = columns
        grid = Array(count: row * columns, repeatedValue: 0.0)
    }
    
    func indexIsValidForRow(row: Int,columns: Int) -> Bool {
        return row >= 0 && row < self.row && columns >= 0 && columns < self.columns
    }
    
    subscript(row: Int,column: Int) -> Double {
        get {
            assert(self.indexIsValidForRow(row, columns: column), "Index out of range")
            return grid[row * column + column]
        }
        set {
            assert(self.indexIsValidForRow(row, columns: column), "Index out of range")
            grid[row * column + column] = newValue
        }
    }
    
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0,1] = 1.2
matrix[1,0] = 2.4

//let someValue = matrix[2,2]






