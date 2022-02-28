//
//  239.swift
//  LeetCodeTests
//
//  Created by 郜宇 on 2022/2/28.
//  Copyright © 2022 gaoyu. All rights reserved.
//

import XCTest

/**
 239. 滑动窗口最大值
 https://leetcode-cn.com/problems/sliding-window-maximum/
 给你一个整数数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。
 你只可以看到在滑动窗口内的 k 个数字。滑动窗口每次只向右移动一位。
 返回 滑动窗口中的最大值 。

 示例 1：
 输入：nums = [1,3,-1,-3,5,3,6,7], k = 3
 输出：[3,3,5,5,6,7]
 解释：
 滑动窗口的位置                最大值
 ---------------               -----
  [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
 
 示例 2：
 输入：nums = [1], k = 1
 输出：[1]
 */

class _239: XCTestCase {
    
    class Solution {
        //方法一: 双端队列 [双端队列是能在头尾两端添加、 删除的队列]    头 双端队列 尾
        //双端队列内放索引, 比如遍历一个元素,从双端队列尾部加入元素->就变成了头部
        
        //时间复杂度O(n)
        func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
            if nums.isEmpty || k < 0  { return [] }
            if k == 1 { return nums } //k=1,每一个都是最大元素
            return []
        }
        
        //方法二: 动态规划
        
    }
    
    func test() {
        XCTAssert(Solution().maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3) == [3,3,5,5,6,7])
        XCTAssert(Solution().maxSlidingWindow([1], 1) == [1])
    }
}
