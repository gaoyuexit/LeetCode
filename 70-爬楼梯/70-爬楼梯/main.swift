//
//  main.swift
//  70-爬楼梯
//
//  Created by 宇郜 on 2019/5/28.
//  Copyright © 2019 宇郜. All rights reserved.
//

import Foundation

/**
 https://leetcode-cn.com/problems/climbing-stairs/
 
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
 
 注意：给定 n 是一个正整数。
 
 示例 1：
 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 
 示例 2：
 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶
 */

/*
 n=4个台阶, 如果我第一步走一个台阶, 求剩下的n-1个台阶有多少种走法
           如果我第一步走二个台阶, 求剩下的n-2个台阶有多少种走法
 第一步只有两种走法:
 f(n) = f(n-1) + f(n-2)
 
 */

//方法一: 递归
class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n <= 3 { return n }
        return climbStairs(n-1) + climbStairs(n-2)
    }
}

//方法二: 循环
class Solution1 {
    func climbStairs(_ n: Int) -> Int {
        if n <= 3 { return n }
        
        var first = 3, second = 2, sum = 0
        //f(4) = f(3) + f(2)
        //f(5) = f(4) + f(3)
        //sum = first + second
        for _ in 4...n {
            sum = first + second
            second = first
            first = sum
        }
        return sum
    }
}


print(Solution1().climbStairs(5))











