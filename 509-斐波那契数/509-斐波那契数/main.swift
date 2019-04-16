//
//  main.swift
//  509-斐波那契数
//
//  Created by 宇郜 on 2019/4/16.
//  Copyright © 2019 宇郜. All rights reserved.
//

import Foundation

/**
 https://leetcode-cn.com/problems/fibonacci-number/
 斐波那契数，通常用 F(n) 表示，形成的序列称为斐波那契数列。该数列由 0 和 1 开始，后面的每一项数字都是前面两项数字的和。也就是：
 F(0) = 0,   F(1) = 1
 F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
 给定 N，计算 F(N)。

 示例 1：
     输入：2
     输出：1
     解释：F(2) = F(1) + F(0) = 1 + 0 = 1.
示例 2：
     输入：3
     输出：2
     解释：F(3) = F(2) + F(1) = 1 + 1 = 2.
示例 3：
     输入：4
     输出：3
     解释：F(4) = F(3) + F(2) = 2 + 1 = 3.
 */



/**
 方法一: 递归
 时间复杂度: O(n^2)
 */
class Solution {
    func fib1(_ N: Int) -> Int {
        if N <= 1 { return N }
        return fib1(N-1) + fib1(N-2)
    }
}



/**
 方法二: 循环, 由低向上, 保存结果
 时间复杂度: O(n)
 0,1,1,2,3,5,8,13,...
 
 F(0) = 0,   F(1) = 1
 N=2,只需要循环一次 first+second
 N=3循环二次
 */
extension Solution {
    func fib2(_ N: Int) -> Int {
        if N <= 1 { return N }
        var first = 0
        var second = 1
        for _ in 0..<N-1 {
            let sum = first + second
            first = second
            second = sum
        }
        return second
    }
}

print(Solution().fib2(2))
print(Solution().fib2(3))
print(Solution().fib2(4))






