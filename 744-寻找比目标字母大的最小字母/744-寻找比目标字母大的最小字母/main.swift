//
//  main.swift
//  744-寻找比目标字母大的最小字母
//
//  Created by 宇郜 on 2019/6/10.
//  Copyright © 2019 宇郜. All rights reserved.
//

import Foundation

/**
 https://leetcode-cn.com/problems/find-smallest-letter-greater-than-target
 744. 寻找比目标字母大的最小字母
 给定一个只包含小写字母的有序数组letters 和一个目标字母 target，寻找有序数组里面比目标字母大的最小字母。
 数组里字母的顺序是循环的。举个例子，如果目标字母target = 'z' 并且有序数组为 letters = ['a', 'b']，则答案返回 'a'。
 
 示例:
 
 输入:
 letters = ["c", "f", "j"]
 target = "a"
 输出: "c"
 
 输入:
 letters = ["c", "f", "j"]
 target = "c"
 输出: "f"
 
 输入:
 letters = ["c", "f", "j"]
 target = "d"
 输出: "f"
 
 输入:
 letters = ["c", "f", "j"]
 target = "g"
 输出: "j"
 
 输入:
 letters = ["c", "f", "j"]
 target = "j"
 输出: "c"
 
 输入:
 letters = ["c", "f", "j"]
 target = "k"
 输出: "c"
 
 
 注:
 
 letters长度范围在[2, 10000]区间内。
 letters 仅由小写字母组成，最少包含两个不同的字母。
 目标字母target 是一个小写字母。
 */

//二分查找 ["a", "b", "c", "f", "j"] target = f,j,k..
//
class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        
        var i = 0
        var j = letters.count-1
        var mid = 0 //中间的下标
        var res = 0
        
        while i <= j {
            mid = i + ((j-i) >> 1) //防止溢出
            if target >= letters[mid] {
                i = mid + 1
            }else if target < letters[mid] {
                j = mid - 1
            }
        }
        if i > mid {
            res = i
        }else if j < mid {
            res = mid
        }else {
            res = mid + 1
        }
        return letters[res % letters.count]
    }
}










