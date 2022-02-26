//
//  59.swift
//  LeetCodeTests
//
//  Created by 宇郜 on 2021/4/28.
//  Copyright © 2021 gaoyu. All rights reserved.
//

import XCTest

/**
 59.螺旋矩阵 II
 https://leetcode-cn.com/problems/spiral-matrix-ii/
 给你一个正整数 n ，生成一个包含 1 到 n^2 所有元素，且元素按顺时针顺序螺旋排列的 n x n 正方形矩阵 matrix 。

 示例:
 输入: 3 输出: [ [ 1, 2, 3 ], [ 8, 9, 4 ], [ 7, 6, 5 ] ]
 
 1    2    3
 8    9    4
 7    6    5
  
 1     2     3     4
 12   13  14    5
 11   16  15    6
 10   9     8     7
 
 
 1  2   3   4   5
 
 
 一些同学做这道题目之所以一直写不好，代码越写越乱。
 就是因为在画每一条边的时候，一会左开又闭，一会左闭右闭，一会又来左闭右开，岂能不乱。
 要坚持循环不变量原则
 解题思路: https://github.com/youngyangyang04/leetcode-master/blob/master/problems/0059.%E8%9E%BA%E6%97%8B%E7%9F%A9%E9%98%B5II.md
 */

class _59 {
    
    static func generateMatrix(_ n: Int) -> [[Int]] {
        
        //初始化二维数组
        var result : [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        var startx: Int = 0, starty: Int = 0  //记录开始位置
        var loop: Int = n / 2   //定义变量，用来记录循环的圈数
        var offset: Int = 1     //每一圈的偏移量
        var num: Int = 1    //填充数字，默认从1开始
        var row: Int, col: Int
        while loop > 0 {
            row = startx
            col = starty
            //填充上行 从左到右，左闭右开
            for index in startx ..< starty + n - offset {
                result[startx][index] = num
                num += 1
                col = index+1
            }

            //填充右行 从上到下，左闭右开
            for index in starty ..< startx + n - offset {
                result[index][col] = num
                num += 1
                row = index+1
            }
            //填充下行 从右到左， 左闭右开（左闭右开，所以starty+1）
            for index in (startx+1 ... col).reversed() {
                result[row][index] = num
                num += 1
                col = index-1
            }
            //填充左行，从下到上，左闭右开 （左闭右开，所以starty+1）
            for index in (starty+1 ... row).reversed() {
                result[index][col] = num
                num += 1
                row = index-1
            }
            //当完成一圈之后，各自的起始位置要+1
            startx += 1
            starty += 1
            //当完成一圈之后，loop-1
            loop -= 1
            //当完成一圈后，x,y轴都将被填充2个，所以此处offset每次循环+2
            offset += 2
        }
        //特殊处理，当n为奇数的时候，
        if n % 2 > 0 {
            result[n/2][n/2] = num
        }
        return result
    }
}

class _59Test: XCTestCase {
    
    func test() {
        
        let matrix = _59.generateMatrix(3)
        XCTAssert(matrix == [ [ 1, 2, 3 ], [ 8, 9, 4 ], [ 7, 6, 5 ] ], "case error")
    }
}

