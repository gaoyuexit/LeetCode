//
//  509.swift
//  LeetCodeTests
//
//  Created by 郜宇 on 2022/4/15.
//  Copyright © 2022 gaoyu. All rights reserved.
//

import XCTest

/**
 509. 斐波那契数
 https://leetcode-cn.com/problems/fibonacci-number/
 斐波那契数 （通常用 F(n) 表示）形成的序列称为 斐波那契数列 。该数列由 0 和 1 开始，后面的每一项数字都是前面两项数字的和。也就是：
 F(0) = 0，F(1) = 1
 F(n) = F(n - 1) + F(n - 2)，其中 n > 1
 给定 n ，请计算 F(n) 。
 
 0, 1, 1, 2, 3, 5, 8, 13
 */

class _509: XCTestCase {
    
    class Solution {
        
        //迭代解法1 -  0, 1, 1, 2, 3, 5, 8, 13
        //2...n循环
        func fib(_ n: Int) -> Int {
            if n <= 1 { return n }
            var first = 0
            var second = 1
            
            //n=2, n=3
            for _ in 2...n {
                let res = first + second
                first = second
                second = res
            }
            return second
        }
        
        //迭代解法2 -  0, 1, 1, 2, 3, 5, 8, 13
        /**
         F(0) = 0,   F(1) = 1
         N=2,只需要循环一次 first+second
         N=3循环二次
         */
        func fib1(_ n: Int) -> Int {
            if n <= 1 { return n }
            var first = 0
            var second = 1
            for _ in 0..<n-1 {
                let sum = first + second
                first = second
                second = sum
            }
            return second
        }
        
        //递归解法
        func fib2(_ n: Int) -> Int {
            if n <= 1 { return n }
            return fib2(n-1) + fib2(n-2)
        }
    }
    
    func test() {
        
        XCTAssert(Solution().fib(2) == 1)
        XCTAssert(Solution().fib(3) == 2)
        XCTAssert(Solution().fib(4) == 3)
    }
}
