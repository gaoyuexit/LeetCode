//
//  offer_62.swift
//  LeetCodeTests
//
//  Created by 宇郜 on 2021/6/30.
//  Copyright © 2021 gaoyu. All rights reserved.
//

import XCTest

/**
 剑指 Offer 62. 圆圈中最后剩下的数字
 https://leetcode-cn.com/problems/yuan-quan-zhong-zui-hou-sheng-xia-de-shu-zi-lcof/
 
 0,1,···,n-1这n个数字排成一个圆圈，从数字0开始，每次从这个圆圈里删除第m个数字（删除后从下一个数字开始计数）。求出这个圆圈里剩下的最后一个数字。

 例如，0、1、2、3、4这5个数字组成一个圆圈，从数字0开始每次删除第3个数字，则删除的前4个数字依次是2、0、4、1，因此最后剩下的数字是3。

 示例 1：
 输入: n = 5, m = 3
 输出: 3
 
 示例 2：
 输入: n = 10, m = 17
 输出: 2
 */

class offer_62 {
    
    /**
     例如，0、1、2、3、4这5个数字组成一个圆圈，从数字0开始每次删除第3个数字，则删除的前4个数字依次是2、0、4、1，因此最后剩下的数字是3。
     f(n,m) n个数字,每次删除第3个元素, 最后剩下的数字
     
     下标:  0  1  2  3  4
     内容:  a  b  c  d  e
     
     f(5,3) = 3   从a开始报数，最后能活下来的是d
     从a开始报数，杀掉c之后，剩下4个人，接下来从d开始报数，最后能活下来的依然是d
     以d为下标0开始报数, 4个人报数, 最终活下来的是d
     
     从5人变为4人，胜利者的下标由3变为0，所以f(5,3)=f(4,3) + 3
     考虑是循环的报数的, 有可能越界: 所以: f(n,m)  = (  f(n-1, m) + m  ) % n
第一次:
     下标:  2  3  0  1
     内容:  a  b  d  e
     */
    class Solution {
        
        //f(n,m)  = (  f(n-1, m) + m  ) % n
        //迭代解法:
        /**
         f(5,3)=( f(4,3) + 3) % 5
         f(4,3)=( f(3,3) + 3) % 4
         f(3,3)=( f(2,3) + 3) % 3
         f(2,3)=( f(1,3) + 3) % 2
         f(1,3)=0
         */
        func lastRemaining(_ n: Int, _ m: Int) -> Int {
            var res = 0
            
            for i in 2...n {
                res = (res + m) % i
            }
            
            return res
        }
        
        //f(n,m)  = (  f(n-1, m) + m  ) % n
        //递归解法:
        func lastRemaining1(_ n: Int, _ m: Int) -> Int {
            if n == 1 { return 0 }
            return (lastRemaining(n-1, m) + m) % n
        }
    }
    
    func test() {
        XCTAssert(Solution().lastRemaining(5, 3) == 3)
        XCTAssert(Solution().lastRemaining(10, 17) == 2)
    }
}

