//
//  main.swift
//  409-最长回文串
//
//  Created by 宇郜 on 2019/3/21.
//  Copyright © 2019 宇郜. All rights reserved.
//

import Foundation

/**
 “回文串”是一个正读和反读都一样的字符串，比如“level”或者“noon”等等就是回文串。
 
 给定一个包含大写字母和小写字母的字符串，找到通过这些字母构造成的最长的回文串。
 在构造过程中，请注意区分大小写。比如 "Aa" 不能当做一个回文字符串。
 注意:
    假设字符串的长度不会超过 1010。
 示例 1:
 输入:
    "abccccdd"
 
 输出:
    7
 解释:
    我们可以构造的最长的回文串是"dccaccd", 它的长度是 7。
 */


/**
 方法一: 遍历字符串, 装入字典中, key为字符, value为该字符符出现的个数, 则最长的回文串的长度
 如果所有成对出现的字母数量，小于字符串总长度，则必存在一个以上的奇数次出现的字母
 */

class Solution {
    
    private var hashMap = [Unicode.Scalar: Int]()
    func longestPalindrome(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        for c in s.unicodeScalars {
            hashMap[c, default: 0] += 1
        }
        //是否有奇数
        var haveOdd = false
        for decom in hashMap.values where (decom%2 == 1){
            haveOdd = true
            break
        }
        let ans = hashMap.values.reduce(0,{$0+$1/2})
        return ans*2 + (haveOdd ? 1 : 0)
    }
}

class Solution1 {
    
    private var hashMap = [Unicode.Scalar: Int]()
    func longestPalindrome(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        for c in s.unicodeScalars {
            hashMap[c, default: 0] += 1
        }
        var result = 0
        for value in hashMap.values {
            if value > 1 {
                value % 2 == 0 ? (result += value) : (result += (value-1))
            }
        }
        
        if result == s.count {
            return result
        }
        return result + 1;
    }
}


print(Solution1().longestPalindrome("abccccdd"))
print(Solution1().longestPalindrome("bb"))
print(Solution1().longestPalindrome("bananas")) //anana


//b a n s
//1 3 2 1




