//
//  7.swift
//  LeetCodeTests
//
//  Created by 郜宇 on 2022/3/26.
//  Copyright © 2022 gaoyu. All rights reserved.
//

import XCTest

/**
 7. 整数反转
 给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。
 如果反转后整数超过 32 位的有符号整数的范围 [−2^31,  2^31 − 1] ，就返回 0。
 假设环境不允许存储 64 位整数（有符号或无符号)。
 示例 1：
 输入：x = 123
 输出：321
 
 示例 2：
 输入：x = -123
 输出：-321
 
 示例 3：
 输入：x = 120
 输出：21

 示例 4：
 输入：x = 0
 输出：0
 */

class _7: XCTestCase {
    
    //1: 123个位    123%10=3
    //2: 123去除个位 123/10=12
    //3: res = 3
    //4: 12的个位 12%10=2
    //5: 12去除个位 12/10=1
    //6: res = (3 * 10) + 2 = 32
    //7: 1的个位   1%10=1
    //8: 1去除个位  1/10=0
    //9: res = (3*10+2)*10+1 = 321
    class Solution {
        //不考虑溢出的做法: 比如x=1289 翻转之后是9821,可能溢出
        func reverse1(_ x: Int) -> Int {
            var x = x
            var res = 0
            while x != 0 {
                res = res*10 + x%10
                x = x/10
            }
            return res
        }
        
        //考虑溢出的做法: 每次求出的res不符合规则的时候,就直接return 0
        //不符合规则: 如果之前的数是1289,求得的res是9821, 那么可以逆向计算;res = res*10 + x%10, 两次res可以互相求出; 如果不能互相求出,说明求出的res溢出了
        func reverse2(_ x: Int) -> Int {
            var x = x
            var res = 0
            while x != 0 {
                let preRes = res
                res = preRes*10 + x%10
                
                if (res-x%10)/10 != preRes { //逆向计算, 看是否溢出
                    return 0
                }
                
                x = x/10
            }
            return res
        }
        
        //********************************************
        //最终版本答案: 因为Int是64位的;
        func reverse(_ x: Int) -> Int {
            var x = x
            var res = 0
            while x != 0 {
                
                res = res*10 + x%10
                //每次res就判断一下, 大规模的数据可以提前终止 [−2^31,  2^31 − 1]
                if res < Int32.min || res > Int32.max { return 0 }
                
                x = x/10
            }
            return res
        }
    }
    
    func test() {
        
        XCTAssert(Solution().reverse(123) == 321)
        XCTAssert(Solution().reverse(-123) == -321)
        XCTAssert(Solution().reverse(120) == 21)
        XCTAssert(Solution().reverse(0) == 0)
        
        XCTAssert(Solution().reverse(1534236469) == 0)
    }
}
