//
//  3.swift
//  LeetCodeTests
//
//  Created by 宇郜 on 2021/4/22.
//  Copyright © 2021 gaoyu. All rights reserved.
//

import XCTest

/**
 3. 无重复字符的最长子串
 
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 示例 1:
 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 
 示例 2:
 输入: s = "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 
 示例 3:
 输入: s = "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
      
 示例 4:
 输入: s = ""
 输出: 0
  

 提示：

 0 <= s.length <= 5 * 104
 s 由英文字母、数字、符号和空格组成

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class _3 {
    
    //1.暴力破解法 - 超出时间限制
    //abcabcbb:
    //ab->abc->abca (max=3) 下标从a开始遍历, 找到重复的结束, 取最大长度
    //bc->bca->bcab (max=3) 下标从从b开始遍历, 找到重复的结束, 取最大长度
    //ca->cab->cabc (max=3) 下标从从c开始遍历, 找到重复的结束, 取最大长度
    //ab->abc->abcb (max=3) 下标从从a开始遍历, 找到重复的结束, 取最大长度
    //...
    static func lengthOfLongestSubstring1(_ s: String) -> Int {
        
        if s.count < 2 {  return s.count }
        
        
        var set = Set<Character>()
        var maxLen = 0
        
        for i in 0..<s.count {
            
            maxLen = max(maxLen, set.count)
            set.removeAll()
            
            for j in i..<s.count {
                
                let c = s[j]!
                
                if set.contains(c) {
                    break
                } else {
                    set.insert(c)
                }
                
            }
        
        }
        
        return maxLen
    }
    
    //2.滑动窗口法
    
    //3.动态规划
    
    
}

class _3Test: XCTestCase {

    let s1 = "abcabcbb"
    let s2 = "bbbbb"
    let s3 = "pwwkew"
    let s4 = ""
    let s5 = " "
    
    func testTwoAdd() {
        
        let s1_max = _3.lengthOfLongestSubstring1(s1)
        let s2_max = _3.lengthOfLongestSubstring1(s2)
        let s3_max = _3.lengthOfLongestSubstring1(s3)
        let s4_max = _3.lengthOfLongestSubstring1(s4)
        let s5_max = _3.lengthOfLongestSubstring1(s5)

        print(s1_max)
        print(s2_max)
        print(s3_max)
        print(s4_max)
        print(s5_max)
        
        XCTAssert(s1_max == 3, "case error")
        XCTAssert(s2_max == 1, "case error")
        XCTAssert(s3_max == 3, "case error")
        XCTAssert(s4_max == 0, "case error")
        XCTAssert(s5_max == 1, "case error")

    }
}
