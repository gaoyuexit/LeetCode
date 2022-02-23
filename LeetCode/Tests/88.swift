//
//  88.swift
//  LeetCodeTests
//
//  Created by 郜宇 on 2022/2/23.
//  Copyright © 2022 gaoyu. All rights reserved.
//

import XCTest

/**
 88. 合并两个有序数组
 https://leetcode-cn.com/problems/merge-sorted-array/
 给你两个按 非递减顺序 排列的整数数组 nums1 和 nums2，另有两个整数 m 和 n ，分别表示 nums1 和 nums2 中的元素数目。
 请你 合并 nums2 到 nums1 中，使合并后的数组同样按 非递减顺序 排列。

 注意：最终，合并后数组不应由函数返回，而是存储在数组 nums1 中。为了应对这种情况，nums1 的初始长度为 m + n，其中前 m 个元素表示应合并的元素，后 n 个元素为 0 ，应忽略。nums2 的长度为 n 。

 示例 1：
 输入：nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
 输出：[1,2,2,3,5,6]
 解释：需要合并 [1,2,3] 和 [2,5,6] 。
 合并结果是 [1,2,2,3,5,6] ，其中斜体加粗标注的为 nums1 中的元素。
 
 示例 2：
 输入：nums1 = [1], m = 1, nums2 = [], n = 0
 输出：[1]
 解释：需要合并 [1] 和 [] 。
 合并结果是 [1] 。
 
 示例 3：
 输入：nums1 = [0], m = 0, nums2 = [1], n = 1
 输出：[1]
 解释：需要合并的数组是 [] 和 [1] 。
 合并结果是 [1] 。
 
 注意，因为 m = 0 ，所以 nums1 中没有元素。nums1 中仅存的 0 仅仅是为了确保合并结果可以顺利存放到 nums1 中。
 
 提示：
 nums1.length == m + n
 nums2.length == n
 0 <= m, n <= 200
 1 <= m + n <= 200
 -109 <= nums1[i], nums2[j] <= 109

 进阶：你可以设计实现一个时间复杂度为 O(m + n) 的算法解决此问题吗?
 */

class _88: XCTestCase {
    
    /**
     [1,2,3,0,0,0]
     [2,5,6]
     定义三个指针, i1,i2, cur(指向num1的末尾元素)
     从后向前遍历, 3和6比较, [1,2,3,0,0,6]
        
     初始值:
      i1,l2分贝表示为两个数组的下标:
      i1     [0 ~ m-1]
      i2     [0 ~ n-1]
      cur   [0 ~ l1.count-1] / [0~m+n-1]
     
    类似于归并排序的merge, 两个有序数组合并成一个有序数组
     
     [5,6,0,0,0]
     [0,2,4]
     */
    class Solution {
        func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
            
            var i1 = m-1
            var i2 = n-1
            var cur = nums1.count-1
            
            //短的数组元素都遍历结束, 就得出最终结果
            /**
             [5,6,0,0,0]   i1 < 0
             [0,2,4]
             */
            while i2 >= 0 {
                if i1 < 0 || nums1[i1] < nums2[i2] { //i1 < 0是实例3的情况
                    nums1[cur] = nums2[i2]
                    cur -= 1
                    i2 -= 1
                } else {
                    nums1[cur] = nums1[i1]
                    cur -= 1
                    i1 -= 1
                }
            }
        }
    }
    
    func test() {
        example1()
        example2()
        example3()
    }
    
    func example1() {
        var nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
        Solution().merge(&nums1, m, nums2, n)
        XCTAssert(nums1 == [1,2,2,3,5,6], "case error")
    }
    func example2() {
        var nums1 = [1], m = 1, nums2 = [Int](), n = 0
        Solution().merge(&nums1, m, nums2, n)
        XCTAssert(nums1 == [1], "case error")
    }
    func example3() {
        var nums1 = [0], m = 0, nums2 = [1], n = 1
        Solution().merge(&nums1, m, nums2, n)
        XCTAssert(nums1 == [1], "case error")
    }

}
