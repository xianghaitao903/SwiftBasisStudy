//
//  main.swift
//  Test
//
//  Created by 向海涛 on 15/12/15.
//  Copyright © 2015年 xianghaitao. All rights reserved.
//

import Foundation

class Point {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int){
        self.x = x
        self.y = y
    }
}

class Machine {
    var location: Point
    
    init() {
        self.location = Point(x: 0, y: 0)
    }
    
    func move(direction: String) {
        print("Do nothing! I'm a machine!")
    }
}


class Robot: Machine {
    let isRobot: Bool = true
    
    override func move(direction: String) {
        switch direction {
        case "Up":
            location.x += 1
        case "Down":
            location.y -= 1
        case "Right":
            location.x += 1
        case "Left":
            location.x -= 1
        default:
            break
        }
    }
}

func getWeekAgoFromDate(startDateString: String) {
    let dateFormatter = NSDateFormatter();
    dateFormatter.dateFormat = "MM/dd/yyyy";
    let startDate = dateFormatter.dateFromString(startDateString);
    let intervalDoubleValue =  60 * 60 * 24 * 7;
    let interval = NSTimeInterval(-intervalDoubleValue);
    let resutltDate = NSDate(timeInterval: interval, sinceDate: startDate!);
    print(dateFormatter.stringFromDate(resutltDate));
}

func twoSum(nums: [Int], _ target: Int) -> [Int] {
    for firstIndex in 0..<nums.count {
        let fistValue = nums[firstIndex];
        let secondValue = target - fistValue;
        let startIndex = firstIndex + 1;
        for secondIndex in startIndex..<nums.count {
            if secondValue == nums[secondIndex] {
                return [firstIndex,secondIndex];
            }
        }
    }
    return [];
}

public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
        self.val = val
        self.next = nil
        }
}


func addTwoNumbers(l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    let resultVal = (l1?.val)! + (l2?.val)!;
    let nextValAdd:Int = resultVal/10;
    let currentVal:Int = resultVal%10;
    l1!.val = currentVal;
    if l1!.next == nil && l2!.next == nil {
        l1?.next = nextValAdd == 0 ? nil : ListNode(nextValAdd);
        return l1;
    }
    l1?.next = l1?.next != nil ? l1?.next : ListNode(0);
    l2?.next = l2?.next != nil ? l2?.next : ListNode(0);
    l1!.next!.val += nextValAdd;
    addTwoNumbers(l1!.next, l2?.next);
    return l1;
}

let l1 = ListNode(0);
//l1.next = ListNode(4);
//l1.next?.next = ListNode(3);

let l2 = ListNode(3);
l2.next = ListNode(7);
//l2.next?.next = ListNode(4);

let result = addTwoNumbers(l1, l2);

//print("\(result!.val)");


func lengthOfLongestSubstring(s: String) -> Int {
    let characters = s.characters;
    var maxlength = 0;
    var subString = "";
    var length = 0;
    for character in characters {
        if subString.containsString("\(character)") {
            length = subString.characters.count;
            maxlength = maxlength > length ? maxlength : length;
            subString = subString.componentsSeparatedByString("\(character)")[1];
        }
        subString.append(character);
    }
    length = subString.characters.count;
    maxlength = maxlength > length ? maxlength : length;
    return maxlength;
}

//print(lengthOfLongestSubstring("sssssssssss"))
//print(lengthOfLongestSubstring("abc"))
//print(lengthOfLongestSubstring("aabbcc"))
//print(lengthOfLongestSubstring("abcabc"))

func findMedianSortedArrays(nums1: [Int], _ nums2: [Int]) -> Double {
    var arr = nums1;
    arr += nums2;
    arr = arr.sort({ (s1: Int, s2: Int) -> Bool in
        return s1 <= s2;
    })
    let isEven = arr.count%2 == 0;
    let index = arr.count/2;
    var result = 0.0;
    if isEven {
        result = (Double)((arr[index - 1] + arr[index])) / 2;
    } else {
        result = (Double)(arr[index]);
    }
    return result;
}
//print(findMedianSortedArrays ([1,2,3],[4,5,6]));

func longestPalindrome(s: String) -> String {
    
    return "";
}



