//
//  209.swift
//  LeetCodeTests
//
//  Created by 宇郜 on 2021/4/27.
//  Copyright © 2021 gaoyu. All rights reserved.
//

import XCTest

/**
 给定一个含有 n 个正整数的数组和一个正整数 target 。
 找出该数组中满足其和 ≥ target 的长度最小的 连续子数组 [numsl, numsl+1, ..., numsr-1, numsr] ，并返回其长度。如果不存在符合条件的子数组，返回 0 。

 示例 1：
 输入：target = 7, nums = [2,3,1,2,4,3]
 输出：2
 解释：子数组 [4,3] 是该条件下的长度最小的子数组。
 
 示例 2：
 输入：target = 4, nums = [1,4,4]
 输出：1
 
 示例 3：
 输入：target = 11, nums = [1,1,1,1,1,1,1,1]
 输出：0
 
 提示：
 1 <= target <= 109
 1 <= nums.length <= 105
 1 <= nums[i] <= 105
 
 进阶：
 如果你已经实现 O(n) 时间复杂度的解法, 请尝试设计一个 O(n log(n)) 时间复杂度的解法。
 */

class _209 {
    
    //推荐参考: https://github.com/youngyangyang04/leetcode-master/blob/master/problems/0209.%E9%95%BF%E5%BA%A6%E6%9C%80%E5%B0%8F%E7%9A%84%E5%AD%90%E6%95%B0%E7%BB%84.md
    //解题1: 暴力破解
    //时间复杂度：O(n^2)
    //空间复杂度：O(1)
    static func minSubArrayLen1(_ target: Int, _ nums: [Int]) -> Int {
        
        var minLen = Int.max, sum = 0
        
        for i in 0..<nums.count { //设置子序列起点为i
            sum = 0
            for j in i..<nums.count { //设置子序列终止位置为j
                sum += nums[j]
                if sum >= target {
                    minLen = min(minLen, j-i+1)
                    break
                }
            }
        }
        
        return minLen == Int.max ? 0 : minLen
    }
    
    
    //解题2: 滑动窗口 - 不断的调节子序列的起始位置和终止位置，从而得出我们要想的结果
    
    static func minSubArrayLen2(_ target: Int, _ nums: [Int]) -> Int {
        
        var minLen = Int.max
        var sum = 0
        var i = 0  //i为滑动窗口的开始位置
        
        for j in 0..<nums.count { //j为滑动窗口的结束位置
            
            sum += nums[j]
            
            while sum >= target {
                
                minLen = min(minLen, j-i+1)
                sum -= nums[i]
                i += 1
            }
            
        }
        
        return minLen == Int.max ? 0 : minLen
    }
    
}

class _209Test: XCTestCase {

    let nums1 = [2,3,1,2,4,3], target1 = 7
    let nums2 = [1,4,4], target2 = 4
    let nums3 = [1,1,1,1,1,1,1,1], target3 = 11
    
    func test1() {
        
        let len1 = _209.minSubArrayLen1(target1, nums1)
        let len2 = _209.minSubArrayLen1(target2, nums2)
        let len3 = _209.minSubArrayLen1(target3, nums3)
        
        XCTAssert(len1 == 2, "case error")
        XCTAssert(len2 == 1, "case error")
        XCTAssert(len3 == 0, "case error")
    }
    
    func test2() {
        
        let len1 = _209.minSubArrayLen2(target1, nums1)
        let len2 = _209.minSubArrayLen2(target2, nums2)
        let len3 = _209.minSubArrayLen2(target3, nums3)
        
        XCTAssert(len1 == 2, "case error")
        XCTAssert(len2 == 1, "case error")
        XCTAssert(len3 == 0, "case error")
    }
}
