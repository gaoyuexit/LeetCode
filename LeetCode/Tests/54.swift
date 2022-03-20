//
//  54.swift
//  LeetCodeTests
//
//  Created by 郜宇 on 2022/3/20.
//  Copyright © 2022 gaoyu. All rights reserved.
//

import XCTest

/**
 给你一个 m 行 n 列的矩阵 matrix ，请按照 顺时针螺旋顺序 ，返回矩阵中的所有元素。

 示例 1：
 输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
 输出：[1,2,3,6,9,8,7,4,5]
 1 2 3
 4 5 6
 7 8 9
 
 示例 2：
 输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 输出：[1,2,3,4,8,12,11,10,9,5,6,7]
 1   2   3   4
 5   6   7   8
 9  10 11 12
 */
class _54: XCTestCase {
    
    //比较不错的题解: https://leetcode-cn.com/problems/spiral-matrix/solution/cxiang-xi-ti-jie-by-youlookdeliciousc-3/
    /**
     首先设定上下左右边界
     其次向右移动到最右，此时第一行因为已经使用过了，可以将其从图中删去，体现在代码中就是重新定义上边界
     判断若重新定义后，上下边界交错，表明螺旋矩阵遍历结束，跳出循环，返回答案
     若上下边界不交错，则遍历还未结束，接着向下向左向上移动，操作过程与第一，二步同理
     不断循环以上步骤，直到某两条边界交错，跳出循环，返回答案
     */
    class Solution {
        func spiralOrder(_ matrix: [[Int]]) -> [Int] {
            var res = [Int]()
            if matrix.isEmpty { return res }
            
            var top = 0
            var bottom = matrix.count-1
            var left = 0
            var right = matrix[0].count-1
            
            //区间[left, right] [top, bottom]
            while top <= bottom && left <= right { //或者while true { }
                //从左到右
                for i in left...right {
                    res.append(matrix[top][i])
                }
                top += 1
                //每次调整边界后, 判断是否符合边界条件
                if top > bottom { break }
                
                //从上到下
                for i in top...bottom {
                    res.append(matrix[i][right])
                }
                right -= 1
                //每次调整边界后, 判断是否符合边界条件
                if left > right { break }
                
                //从右到左
                for i in (left...right).reversed() {
                    res.append(matrix[bottom][i])
                }
                bottom -= 1
                //每次调整边界后, 判断是否符合边界条件
                if top > bottom { break }
                
                //从下到上
                for i in (top...bottom).reversed(){
                    res.append(matrix[i][left])
                }
                left += 1
                //每次调整边界后, 判断是否符合边界条件
                if left > right { break }
            }
            return res
        }
    }
    
    func test() {
        XCTAssert(Solution().spiralOrder([[1,2,3],[4,5,6],[7,8,9]]) == [1,2,3,6,9,8,7,4,5])
        XCTAssert(Solution().spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]]) == [1,2,3,4,8,12,11,10,9,5,6,7])
    }
}
