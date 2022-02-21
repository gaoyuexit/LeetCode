//
//  offer_47.swift
//  LeetCodeTests
//
//  Created by 郜宇 on 2022/2/21.
//  Copyright © 2022 gaoyu. All rights reserved.
//

import XCTest

/**
 剑指 Offer 47. 礼物的最大价值
 https://leetcode-cn.com/problems/li-wu-de-zui-da-jie-zhi-lcof/
 
 在一个 m*n 的棋盘的每一格都放有一个礼物，每个礼物都有一定的价值（价值大于 0）。你可以从棋盘的左上角开始拿格子里的礼物，并每次向右或者向下移动一格、直到到达棋盘的右下角。给定一个棋盘及其上面的礼物的价值，请计算你最多能拿到多少价值的礼物？
 
 示例 1:
 输入:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 输出: 12
 解释: 路径 1→3→5→2→1 可以拿到最多价值的礼物
 
 提示：
 0 < grid.length <= 200
 0 < grid[0].length <= 200
 */


/**
 动态规划:  dp二维数组
 1: f(m, n) 表示 从棋盘左上角到右下角, 向左走m步, 向下走n步的最大价值
 2: 状态方程:  f(m,n) = Max(f(m,n-1), f(m-1,n))  +  grid[m][n]
 3: 范围: m = [0,size)  走0步, 走1步, 走2步  n=[0,size)
 4: 初始值: f(0,0) = grid[0][0]
  m < 0, n < 0; dp[m][n] = 0
 
 //print(dp)  //根据打印的dp二维数组,可以把dp二维数组优化成 一维数组或者滚动数组, 减少内存消耗
 //因为求每个dp[m][n], 用到了dp[m-1][n]和dp[m][n-1]; 两个地方的下标;
 */
class Solution {
    func maxValue(_ grid: [[Int]]) -> Int {
        
        if grid.isEmpty { return 0 }
        //dp二维数组表示f(m,n)每一步的最大价值
        var dp = Array(repeating: Array(repeating: 0, count: grid[0].count), count: grid.count)
        
        let mMax = grid.count-1
        let nMax = grid[0].count-1
        
        for m in 0...mMax {
            for n in 0...nMax {
                if m == 0 && n == 0 {
                    dp[m][n] = grid[0][0]
                } else if m == 0 { //m == 0 && n > 0
                    dp[m][n] = dp[m][n-1] + grid[m][n]
                } else if n == 0 { //n == 0 && m > 0
                    dp[m][n] = dp[m-1][n] + grid[m][n]
                } else { //m != 0 && n !=0
                    dp[m][n] = max(dp[m][n-1], dp[m-1][n]) + grid[m][n]
                }
            }
        }
        //printdp(dp)
        return dp[mMax][nMax];
    }
    
    //打印dp数组
    func printdp(_ dp: [[Int]]) {
        for array in dp {
            for n in array {
                print(n, terminator: "\t")
            }
            print("")
        }
    }
    
    
    /**
     动态规划优化:  dp一维数组
     //print(dp)  //根据打印的dp二维数组,可以把dp二维数组优化成 一维数组或者滚动数组, 减少内存消耗

   [1,3,1],
   [1,5,1],
   [4,2,1]
     打印的dp数组如下:
     1    4    5
     2    9    10
     6    11    12
     
     dp中的9   为  4和2的最大值  + 5;
     dp中的10 为  5和9的最大值  + 1;
          
    所以:
     0: 创建一个一维数组
     1: 先把第一行dp的值放到数组内, 即求m=0的所有礼物的最大值  dp=[1,4,5]
     2: 第二行 第一个礼物: 更新dp[0] = dp[0]+grid[1][0]  = 2;
     3: 第二行 第二个礼物: 更新dp[1] = max(dp[0],dp[1]) + grid[1][1] = 9
     */
    func maxValue1(_ grid: [[Int]]) -> Int {
        
        if grid.isEmpty { return 0 }
        //dp优化成一维数组, 以列数为数组的个数 grid[0].count
        var dp = Array(repeating: 0, count: grid[0].count)
        
        let mMax = grid.count-1
        let nMax = grid[0].count-1
        
        for m in 0...mMax {
            for n in 0...nMax {
                if m == 0 && n == 0 {
                    dp[n] = grid[0][0]
                } else if m == 0 { //m == 0 && n > 0   --> 先把第一行装入一维数组内
                    dp[n] = dp[n-1] + grid[m][n]
                } else if n == 0 { //n == 0 && m > 0
                    dp[n] = dp[n] + grid[m][n]
                } else { //m != 0 && n !=0
                    dp[n] = max(dp[n-1], dp[n]) + grid[m][n]
                }
            }
        }
        return dp[nMax];
    }
    
}

class offer_47: XCTestCase {
    
    func test() {
        let grid = [
            [1,3,1],
            [1,5,1],
            [4,2,1]
        ]
        
        let grid2 = [
            [1,2,5],
            [3,2,1]
        ]
        
        XCTAssert(Solution().maxValue1(grid) == 12, "case error")
        
        XCTAssert(Solution().maxValue1(grid2) == 9, "case error")
    }
}
