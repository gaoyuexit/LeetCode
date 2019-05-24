//
//  main.swift
//  136-只出现一次的数字
//
//  Created by 宇郜 on 2019/5/21.
//  Copyright © 2019 宇郜. All rights reserved.
//

import Foundation


/**
 https://leetcode-cn.com/problems/single-number/
 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。
 
 说明：
 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？
 
 示例 1:
 输入: [2,2,1]
 输出: 1
 
 示例 2:
 输入: [4,1,2,1,2]
 输出: 4
 */


/**
 方法一: 使用额外的空间
 */
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var dict = [Int: Int]() //key:nums[i]  value: count
        

        for i in 0..<nums.count {
            let num = nums[i]
            if dict.keys.contains(num){
                dict[num] = dict[num]! + 1
            }else{
                dict[num] = 1
            }
        }
        return dict.first { return $0.value == 1 }!.key
    }
}

let nums = [4,1,2,1,2]
print(Solution().singleNumber(nums))
