//
//  main.swift
//  offer-3-数组中重复的数字
//
//  Created by 宇郜 on 2019/3/26.
//  Copyright © 2019 宇郜. All rights reserved.
//

import Foundation

/**
 找出数组中重复的数字
 
 在一个长度为n的数组里的所有数字都在0~n-1的范围内, 数组中某些数字是重复的, 但不知道有几个数字重复了, 也不知道每个数字重复了几次, 请找出数组中任意一个重复的数字, 例如, 如果输入长度为7的数组 { 2, 3, 1, 0, 2, 5, 3 }, 那么对应的输出是重复的数字 2或者3
 */

/**
 方法一: 顺序扫描数组, 每扫描一个数字, 就用O(1)的时间判断哈希表里是否包含该数字
    复杂度为O(n)
    空间效率为O(n)
 */


/**
 方法二: 关注点为 长度为n的数组里的所有数字都在0~n-1的范围内
 长度为n的数组里的所有数字都在0~n-1的范围内, 如果没有重复的数字, 排序好的数组为每个下标的都和他们的对应的值相等
 我们扫描数组 { 2, 3, 1, 0, 2, 5, 3 }
 下标为0的数字为2, 将2放到下标为2的地方, 找到他合适的位置, 即 2和1 交换 { 1, 3, 2, 0, 2, 5, 3 }
 交换后的下标为0的位置为1, 将1放到下标为1的地方, 即 { 3, 1, 2, 0, 2, 5, 3 }
 ....{ 0, 1, 2, 3, 2, 5, 3 } //交换后如果下标和值相等了, 扫描下一个下标
 
 复杂度为O(n)
 空间效率为O(1)
 */

class Solution {
    func repeatedNumber(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else { return -1 }
        
        for i in 0..<nums.count {
            while i != nums[i] {
                let v = nums[i]
                if v == nums[v] { return v }
                let tmp = nums[v]
                nums[v] = nums[i]
                nums[i] = tmp
            }
        }
        return -1
    }
}

var nums = [ 2, 3, 1, 0, 2, 5, 3 ]
print(Solution().repeatedNumber(&nums))






