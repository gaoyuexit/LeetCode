//
//  main.swift
//  724-寻找数组的中心索引
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 gaoyu. All rights reserved.
//

import Foundation

/**
 题目:
     给定一个整数类型的数组 nums，请编写一个能够返回数组“中心索引”的方法。
     我们是这样定义数组中心索引的：数组中心索引的左侧所有元素相加的和等于右侧所有元素相加的和。
     如果数组不存在中心索引，那么我们应该返回 -1。如果数组有多个中心索引，那么我们应该返回最靠近左边的那一个。
 示例 1:
     输入:
     nums = [1, 7, 3, 6, 5, 6]
     输出: 3
     解释:
     索引3 (nums[3] = 6) 的左侧数之和(1 + 7 + 3 = 11)，与右侧数之和(5 + 6 = 11)相等。
     同时, 3 也是第一个符合要求的中心索引。

 示例 2:
     输入:
     nums = [1, 2, 3]
     输出: -1
     解释:
     数组中不存在满足此条件的中心索引。
 说明:
     nums 的长度范围为 [0, 10000]。
     任何一个 nums[i] 将会是一个范围在 [-1000, 1000]的整数。
     let nums = [-1,-1,-1,0,1,1] //这个应该输出 下标 0
 */

//方法一: 暴力解法 超时
class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else{ return -1 }
        for i in 0..<nums.count {
            if sum(Array(nums[0..<i])) == sum(Array(nums[i+1..<nums.count])) {
                return i
            }
        }
        return -1
    }
    
    func sum(_ subNums: [Int]) -> Int {
        return subNums.reduce(0, +)
    }
}

//方法二:求出总和, 遍历下标, 比较左边和,右边和
class Solution2 {
    func pivotIndex(_ nums: [Int]) -> Int {
        var (leftSum, rightSum) = (0, nums.reduce(0,+)) //下标等于0时 左边和为0 右边的为总和
        for (index, num) in nums.enumerated() {// [1, 7, 3, 6, 5, 6]
            rightSum -= num
            if leftSum == rightSum { return index }
            leftSum += num
        }
        return -1
    }
}




let nums = [-1,-1,-1,0,1,1] //这个应该输出 下标 0
print(Solution().pivotIndex(nums))






