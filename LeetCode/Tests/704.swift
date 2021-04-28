//
//  704.swift
//  LeetCodeTests
//
//  Created by 宇郜 on 2021/4/22.
//  Copyright © 2021 gaoyu. All rights reserved.
//

import XCTest

/**
 给定一个 n 个元素有序的（升序）整型数组 nums 和一个目标值 target  ，写一个函数搜索 nums 中的 target，如果目标值存在返回下标，否则返回 -1。

 示例 1:
 输入: nums = [-1,0,3,5,9,12], target = 9
 输出: 4
 解释: 9 出现在 nums 中并且下标为 4
 
 示例 2:
 输入: nums = [-1,0,3,5,9,12], target = 2
 输出: -1
 解释: 2 不存在 nums 中因此返回 -1
  

 提示：
 你可以假设 nums 中的所有元素是不重复的。
 n 将在 [1, 10000]之间。
 nums 的每个元素都将在 [-9999, 9999]之间。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-search
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class _704 {
    
    //推荐参考:https://github.com/youngyangyang04/leetcode-master/blob/master/problems/0704.%E4%BA%8C%E5%88%86%E6%9F%A5%E6%89%BE.md
    //解题1:
    //定义 target 是在一个在左闭右闭的区间里，也就是[left, right]
    //即: int left = 0;  int right = nums.size() - 1
    static func search1(_ nums: [Int], _ target: Int) -> Int {
        
        var left = 0
        var right = nums.count - 1 //定义target在左闭右闭的区间里，[left, right]
        
        while left <= right { //当left==right，区间[left, right]依然有效，所以用 <=
            
            let middle = left + ((right-left)>>1) //防止溢出 等同于(left + right)/2
            if target > nums[middle] {
                left = middle + 1   //target 在右区间，所以[middle + 1, right]
            } else if target < nums[middle] {
                right = middle - 1  //target 在左区间，所以[left, middle - 1]
            } else {
                return middle       //数组中找到目标值，直接返回下标
            }
        }
    
        return -1
    }
    
    //解题2:
    //定义 target 是在一个在左闭右闭的区间里，也就是[left, right)
    //即: int left = 0;  int right = nums.size()
    static func search2(_ nums: [Int], _ target: Int) -> Int {
        
        var left = 0
        var right = nums.count
        
        while left < right {
            
            let middle = left + ((right-left)/2)
            if target > nums[middle] {
                left = middle + 1
            } else if target < nums[middle] {
                right = middle
            } else {
                return middle
            }
        }
    
        return -1
    }
}

class _704Test: XCTestCase {

    let nums = [-1,0,3,5,9,12], target1 = 9, target2 = 2
    
    func test1() {
        
        let idx1 = _704.search1(nums, target1)
        let idx2 = _704.search1(nums, target2)
        
        XCTAssert(idx1 == 4, "case error")
        XCTAssert(idx2 == -1, "case error")
    }
    
    func test2() {
        
        let idx1 = _704.search2(nums, target1)
        let idx2 = _704.search2(nums, target2)
        
        XCTAssert(idx1 == 4, "case error")
        XCTAssert(idx2 == -1, "case error")
    }
}

