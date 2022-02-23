//
//  75.swift
//  LeetCodeTests
//
//  Created by 郜宇 on 2022/2/23.
//  Copyright © 2022 gaoyu. All rights reserved.
//

import XCTest

/**
 75. 颜色分类
 https://leetcode-cn.com/problems/sort-colors/
 
 给定一个包含红色、白色和蓝色、共 n 个元素的数组 nums ，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。
 我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。
 必须在不使用库的sort函数的情况下解决这个问题。

 示例 1：
 输入：nums = [2,0,2,1,1,0]
 输出：[0,0,1,1,2,2]
 
 示例 2：
 输入：nums = [2,0,1]
 输出：[0,1,2]
  
 提示：
 n == nums.length
 1 <= n <= 300
 nums[i] 为 0、1 或 2
  
 进阶：
 你可以不使用代码库中的排序函数来解决这道题吗？
 你能想出一个仅使用常数空间的一趟扫描算法吗？
 */



// 题解: 荷兰国旗问题🇳🇱:  红白蓝颜色的国旗
// 扫描一遍就能得出结果的且空间复杂度为O(1)的问题, 一般都是使用双指针, 三指针来解决, 滑动窗口等来解决
// 双指针解法:
// p0表示指向的是0位置的下标, 初始值为0
// p2表示指向的是2位置的下标, 初始值为nums.lenth-1
// 遍历每个元素, 遇到0元素, 和p0交换,p0++, 遇到1,跳过, 遇到2,和p2位置元素交换; p2--
// 循环条件 i <= p2
class _75: XCTestCase {
    //2,0,2,1,1,0
    //0,0,2,1,1,2
    class Solution {
        func sortColors(_ nums: inout [Int]) {
            if nums.count < 2 { return }
            var p0 = 0
            var p2 = nums.count-1
            var i = 0
            while i <= p2 {
                if nums[i] == 0 {
                    swap(&nums, i: i, j: p0)
                    p0 += 1
                    i += 1
                } else if nums[i] == 1 {
                    i += 1
                } else {//2
                    swap(&nums, i: i, j: p2)
                    p2 -= 1
                }
            }
        }
        
        func swap(_ nums: inout [Int], i: Int, j: Int) {
            let tmp = nums[i]
            nums[i] = nums[j]
            nums[j] = tmp
        }
    }
    
    func test() {
        var nums1 = [2,0,2,1,1,0]
        Solution().sortColors(&nums1)
        XCTAssert(nums1 == [0,0,1,1,2,2], "case error")

        var nums2 = [2,0,1]
        Solution().sortColors(&nums2)
        XCTAssert(nums2 == [0,1,2], "case error")
    }
}
