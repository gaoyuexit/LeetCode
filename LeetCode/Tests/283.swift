//
//  283.swift
//  LeetCodeTests
//
//  Created by 郜宇 on 2022/3/7.
//  Copyright © 2022 gaoyu. All rights reserved.
//

import XCTest

/**
 283. 移动零
 https://leetcode-cn.com/problems/move-zeroes/
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 请注意 ，必须在不复制数组的情况下原地对数组进行操作。

 示例 1:
 输入: nums = [0,1,0,3,12]
 输出: [1,3,12,0,0]

 示例 2:
 输入: nums = [0]
 输出: [0]
 */

class _283: XCTestCase {
    /**
     题解: 双指针  遍历一遍 时间复杂度O(n), 空间O(1)
     [0,1,0,3,12]
     遍历所有元素, 等于0跳过, 不等于0, 则和cur位置的元素交换;
     变量cur和i;  i负责遍历每一个元素, cur表示存放非0元素的位置  初始值i=0, cur=0
     */
    class Solution {
        func moveZeroes(_ nums: inout [Int]) {
            if nums.count < 2 { return } //0/1个元素
            //cur表示存放非0元素的位置
            var cur = 0
            for i in 0..<nums.count {
                if nums[i] == 0 { continue }
                if cur != i {
                    nums[cur] = nums[i]
                    nums[i] = 0
                }
                cur += 1
            }
        }
    }
    func test() {
        var nums1 = [0,1,0,3,12]
        Solution().moveZeroes(&nums1)
        XCTAssert(nums1 == [1,3,12,0,0])
        
        var nums2 = [0]
        Solution().moveZeroes(&nums2)
        XCTAssert(nums2 == [0])
    }
}
