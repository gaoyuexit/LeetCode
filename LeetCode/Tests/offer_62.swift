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
    
    static func lastRemaining(_ n: Int, _ m: Int) -> Int {
        
        
        return 10
    }
}

class offer_62Test: XCTestCase {

    let case0 = [2, 4, 6, 7, 8]
    let case1 = [2, 7, 11, 15]
    let case2 = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]

    func test() {
        let result0 = TwoSum.twoSum(case0, 9)
        XCTAssert(result0.count == 2 && case0[result0.first!] + case0[result0.last!] == 9, "case0 error")
    }
    
}

