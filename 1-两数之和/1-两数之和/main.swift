//
//  main.swift
//  1-TwoSum
//
//  Created by apple on 2018/9/21.
//  Copyright © 2018年 gaoyu. All rights reserved.
//

import Foundation

/**
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */

/**
 [
 2: 0,
 7: 1,
 11: 2,
 15: 3,
 ]
 */


// 暴力方法需要两次循环以此相加进行比较, 如果将nums装进一个字典中, 字典是个哈希表, 取值为O(1), 直接遍历一次数组nums即可, 看看需要的另外的值是否在字典中(O(1)),
// 方式一: 先遍历一遍将nums中的下标和值放到字典中, 在遍历一次nums数组比较, 是否和为target
// 方式二: 因为是nums中的两个数的值为target, 所以num[0]+num[1]=target 或者 num[1]+num[0]=target 这两种都是正确的, 所以可以只遍历一次数组, 看看另外的一个需要的值是否在字典中, 如果不在就讲下标和值放入到字典中, 因为target需要的数组中的两个值, 返回的时候返回 [otherIndex, i], 因为otherIndex是先放进字典的下标,比较小


// 1. hash Table
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.count > 1 else { return [] }
    var hashTable = [Int: Int]();
    for(i, num) in nums.enumerated() {
        //other number
        //eg: 2 = 9 - 7  other need 2, 2 in hash Table?
        let other = target - num;
        if let otherIndex = hashTable[other] {
            return [otherIndex, i]
        }else{
            hashTable[num] = i
        }
    }
    return []
}

let nums = [2, 7, 11, 15]
let target = 9
let result = twoSum(nums, target)
print(result)






