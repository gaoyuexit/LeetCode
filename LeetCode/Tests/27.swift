//
//  27.swift
//  LeetCodeTests
//
//  Created by 宇郜 on 2021/4/23.
//  Copyright © 2021 gaoyu. All rights reserved.
//

import XCTest

/**
 27. 移除元素
 题目地址：https://leetcode-cn.com/problems/remove-element/

 给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。
 不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并原地修改输入数组。
 元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。
 示例 1: 给定 nums = [3,2,2,3], val = 3, 函数应该返回新的长度 2, 并且 nums 中的前两个元素均为 2。 你不需要考虑数组中超出新长度后面的元素。
 示例 2: 给定 nums = [0,1,2,2,3,0,4,2], val = 2, 函数应该返回新的长度 5, 并且 nums 中的前五个元素为 0, 1, 3, 0, 4。
 你不需要考虑数组中超出新长度后面的元素。
 
 https://leetcode-cn.com/problems/remove-element/
 */

class _27 {
    
    //推荐:https://github.com/youngyangyang04/leetcode-master/blob/master/problems/0027.%E7%A7%BB%E9%99%A4%E5%85%83%E7%B4%A0.md
    
    //解题一: 暴力破解, 这里模拟C语言的静态数组
    //时间复杂度：$O(n^2)
    //空间复杂度：$O(1)
    static func removeElement1(_ nums: inout [Int], _ val: Int) -> Int {
        
        var size = nums.count
        var i = 0
        
        while i < size {
            
            if nums[i] == val { //遍历后面的元素向前覆盖
                
                var j = i + 1
                while j < size {
                    nums[j-1] = nums[j]
                    j += 1
                }
                size -= 1 //此时数组的大小-1
                i -= 1    //因为下表i以后的数值都向前移动了一位，所以i也向前移动一位
            }
            
            i += 1
        }
        return size
    }
    
    // 解题二: 双指针法（快慢指针法）
    //时间复杂度：$O(n)
    //空间复杂度：$O(1)
    static func removeElement2(_ nums: inout [Int], _ val: Int) -> Int {
        
        var slowIdx = 0
        
        for fastIdx in 0..<nums.count {
            
            if nums[fastIdx] != val {
                nums[slowIdx] = nums[fastIdx]
                slowIdx += 1
            }
            
        }
        
        return slowIdx
    }
}

class _27Test: XCTestCase {

    var nums1 = [3,2,2,3], val1 = 3
    var nums2 = [0,1,2,2,3,0,4,2], val2 = 2
    
    
    func test1() {
        
        let len1 = _27.removeElement1(&nums1, val1)
        let len2 = _27.removeElement1(&nums2, val2)
        
        XCTAssert(len1 == 2, "case error")
        XCTAssert(len2 == 5, "case error")
    }
    
    func test2() {
        let len1 = _27.removeElement2(&nums1, val1)
        let len2 = _27.removeElement2(&nums2, val2)
        
        XCTAssert(len1 == 2, "case error")
        XCTAssert(len2 == 5, "case error")
    }
}
