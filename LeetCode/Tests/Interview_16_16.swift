//
//  Interview_16_16.swift
//  LeetCodeTests
//
//  Created by 郜宇 on 2022/2/23.
//  Copyright © 2022 gaoyu. All rights reserved.
//

import XCTest

/**
 面试题 16.16. 部分排序
 https://leetcode-cn.com/problems/sub-sort-lcci/
 
 给定一个整数数组，编写一个函数，找出索引m和n，只要将索引区间[m,n]的元素排好序，整个数组就是有序的。注意：n-m尽量最小，也就是说，找出符合条件的最短序列。函数返回值为
 [m,n]，若不存在这样的m和n（例如整个数组是有序的），请返回[-1,-1]。

 示例：
 输入： [1,2,4,7,10,11,7,12,6,7,16,18,19]
 输出： [3,9]
 
 提示：
 0 <= len(array) <= 1000000
 */


/**
题解:
寻找逆序对的位置   [2,5]->正常,   [5,2]->5和2逆序对;   [5,2,8,3]->5和2逆序对, 5和3是逆序对(右边最大的逆序对), 8和3逆序对,

1: 从左向右遍历:
每遍历一个元素, 记录之前遍历过的最大值,  如果发现当前值小于最大值, 记录当前的位置; (当前位置就是逆序对的最右的边的下标)
2: 从右向左遍历:
每遍历一个元素, 记录之前遍历过的最小值,  如果发现当前值大于最大值, 记录当前的位置; (当前位置就是逆序对的最左的边的下标)
 */
class Interview_16_16: XCTestCase {
    
    class Solution {
        func subSort(_ array: [Int]) -> [Int] {
            
            if array.count < 2 { return [-1, -1] }
            
            //从左遍历一次, 找最右的逆序对
            var right = -1
            var max = array[0]
            for i in 1..<array.count {
                if array[i] >= max {
                    max = array[i]
                } else {
                    right = i
                }
            }
            //不符合要求
            if right == -1 { return [-1, -1] }
            
            
            //从右遍历一次
            var left = -1
            var min = array[array.count-1]
            
            //stride(from: array.count-2, through: 0, by: -1) [array.count-2, 0]
            //stride(from: array.count-2, to: 0, by: -1) [array.count-2, 0)
            
//            for i in stride(from: array.count-2, through: 0, by: -1) {
//                if array[i] <= min {
//                    min = array[i]
//                } else {
//                    left = i
//                }
//            }
            for i in (0...array.count-2).reversed() {
                if array[i] <= min {
                    min = array[i]
                } else {
                    left = i
                }
            }
            if left == -1 { return [-1, -1] }
            
            return [left, right]
        }
    }
    
    func test() {
        let array = [1,2,4,7,10,11,7,12,6,7,16,18,19]
        print(Solution().subSort(array))
        XCTAssert(Solution().subSort(array) == [3,9])
    }

}
