//
//  main.swift
//  747-至少是其他数字两倍的最大数
//
//  Created by apple on 2019/3/14.
//  Copyright © 2019 gaoyu. All rights reserved.
//

import Foundation

/**
题目:
 在一个给定的数组nums中，总是存在一个最大元素 。
 查找数组中的最大元素是否至少是数组中每个其他数字的两倍。
 如果是，则返回最大元素的索引，否则返回-1。
 
示例 1:
 输入: nums = [3, 6, 1, 0]
 输出: 1
 解释: 6是最大的整数, 对于数组中的其他整数,
 6大于数组中其他元素的两倍。6的索引是1, 所以我们返回1.

示例 2:
 输入: nums = [1, 2, 3, 4]
 输出: -1
 解释: 4没有超过3的两倍大, 所以我们返回 -1.

提示:
 nums 的长度范围在[1, 50].
 每个 nums[i] 的整数范围在 [0, 99].
 */

//解法:
//1.找到数组中最大值m
//2.遍历数组 x != m with m < 2*x 返回-1 否则返回最大值的下标
class Solution {
    
    func dominantIndex(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return -1 }
        //最大值的下标
        var maxIndex = 0 //最大值的下标
        for i in 1..<nums.count {
            if nums[i] > nums[maxIndex] {
                maxIndex = i
            }
        }
        //遍历数组
        for i in 0..<nums.count {
            if maxIndex != i && nums[maxIndex] < 2 * nums[i] {
                return -1
            }
        }
        return maxIndex;
    }
}




