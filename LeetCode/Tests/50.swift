//
//  50.swift
//  LeetCodeTests
//
//  Created by 郜宇 on 2022/3/15.
//  Copyright © 2022 gaoyu. All rights reserved.
//

import XCTest

/**
 实现 pow(x, n) ，即计算 x 的 n 次幂函数（即，x^n ）。
 示例 1：
 输入：x = 2.00000, n = 10
 输出：1024.00000
 示例 2：
 输入：x = 2.10000, n = 3
 输出：9.26100
 示例 3：
 输入：x = 2.00000, n = -2
 输出：0.25000
 解释：2^-2 = 1/22 = 1/4 = 0.25
 
 提示：
 -100.0 < x < 100.0
 -(2^31) <= n <= (2^31) -1
 -10^4 <= x^n <= 10^4
 */


/**
 需要知道的知识点:
 
 // 因为-1的二进制为 11111111111
 // -1 >> 1 = -1       -1右移一位还是-1, 负数右移前面补1, 还是11111111111
 // -1 >> 10 = -1     -1右移十位位还是-1, 负数右移前面补1, 还是11111111111
 
 在正整数情况下:  n/2 等价于 n>>1
 在负数情况下:
 n为偶数  n/2 等价于 n>>1

 n为奇数时:
 n = -7;    n/2    = -3
 n = -7;    n>>1 = -4
 
 快速幂补充:
 请设计一个算法求x的y次幂模z的结果：(x^y) % z , 假设x、y都可能是很大的整数 ×≥0，y≥0，z≠0;
 因为x、y都可能是很大的整数, 所以 x^y 用int, long等类型接收, 可能溢出, 造成错误的结果, 可以参考下面的公式来进行优化
 公式须知 (a*b)%p==((a%p)*(b%p))%p
 */

class _50: XCTestCase {
    
    class Solution {
        
        //快速幂(分治) + 迭代   (推荐做法)
        //时间复杂度为logN, 空间复杂度为O(1)
        /**
         9的二进制为1001
         n=9
          =(1001)b
          =(1*2^3)  + (0*2^2) + (0*2^1) + (1*2^0)
         
        x^n = x^9 = x^ ( (1*2^3)  + (0*2^2) + (0*2^1) + (1*2^0) )
                  = x^(1*8)  *  x^(0*4)  * x^(0*2)  * x^(1*1)
         
         x^9次方对应的二进制 (1001) 和每个二进制位的权值如下
         1           0            0          1
         x^8      x^4        x^2      x^1
         最终结果就是所有二进制位为1的权值之积：x^8 * x^1 = x^9
            
         x^8 = x^4  * x^4
         x^4 = x^2  * x^2
         */
        func myPow(_ x: Double, _ n: Int) -> Double {
            return n >= 0 ? pow(x, n) : (1/pow(x, -n))
        }
        
        func pow(_ x: Double, _ n: Int) -> Double {
            var x1 = x
            var n1 = n
            var result = 1.0
            //从后遍历n1的每一个二进制位
            while(n1 > 0) {
            
                if (n1 & 1) == 1 {
                    result *= x1
                }
                x1 *= x1
                n1 >>= 1
            }
            return result
        }
        
        //快速幂(分治) + 递归
        //时间复杂度为T(n) = T(n/2) + O(1) -> 时间复杂度为logN, 空间复杂度为logN
        //3^20 = 3^10 * 3^10
        //3^21 = 3^10 * 3^10 * 3^1
        //3^-21 = 3^-10 * 3^-10 * 3^-1  = 1 / (3^10 * 3^10 * 3^1)
                
        func myPow2(_ x: Double, _ n: Int) -> Double {
            return n >= 0 ? quickMul(x, n) : 1.0 / quickMul(x, -n);
        }
        
        func quickMul(_ x: Double, _ n: Int) -> Double {
            if n == 0 { return 1 }
            if n == 1 { return x }
            //判断n是奇数还是偶数 odd奇数
            //let odd = n % 2 == 1
            
            //使用二进制最后一位判断奇数偶数
            let odd = (n & 1) == 1
            let y = quickMul(x, n >> 1)//n>>1相当于n/2
            return odd ? (y * y * x) : (y * y)
        }
        
        
        //不推荐 -> 超过时间限制
        //将n个x进行相乘 时间复杂度：0(n) 空间复杂度：0(1)
        func myPow1(_ x: Double, _ n: Int) -> Double {
            
            if n == 0 { return 1 }//x^0 = 1
            
            var result = 1.0
            if n > 0 { // n个x相乘
                
                for _ in 0..<n {
                    result = result * x
                }
                
            } else { // x^-1 = 1/x   x^-2=(1/x)/x
                
                for _ in 0..<(-n) {
                    result = result / x
                }
                
            }
            return result
        }
    }
    
    func test() {
        //Double的比较
        XCTAssert(Solution().myPow(2.00000, 10) ~== 1024.00000)
        XCTAssert(Solution().myPow(2.10000, 3) ~== 9.26100)
        XCTAssert(Solution().myPow(2.00000, -2) ~== 0.25000)
    }
}

infix operator ~==
infix operator ~<=
infix operator ~>=

extension Double {
    static func ~== (lhs: Double, rhs: Double) -> Bool {
        // If we add even a single zero more,
        // our Decimal test would fail.
        fabs(lhs - rhs) < 0.000000000001
    }

    static func ~<= (lhs: Double, rhs: Double) -> Bool {
        (lhs < rhs) || (lhs ~== rhs)
    }

    static func ~>= (lhs: Double, rhs: Double) -> Bool {
        (lhs > rhs) || (lhs ~== rhs)
    }
}
