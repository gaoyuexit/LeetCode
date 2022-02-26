//
//  151.swift
//  LeetCodeTests
//
//  Created by 郜宇 on 2022/2/18.
//  Copyright © 2022 gaoyu. All rights reserved.
//

import XCTest
/**
 151. 翻转字符串里的单词
 https://leetcode-cn.com/problems/reverse-words-in-a-string/
 
 给你一个字符串 s ，逐个翻转字符串中的所有 单词 。
 单词 是由非空格字符组成的字符串。s 中使用至少一个空格将字符串中的 单词 分隔开。
 请你返回一个翻转 s 中单词顺序并用单个空格相连的字符串。

 说明：
 输入字符串 s 可以在前面、后面或者单词间包含多余的空格。
 翻转后单词间应当仅用一个空格分隔。
 翻转后的字符串中不应包含额外的空格。
  
 示例 1：
 输入：s = "the sky is blue"
 输出："blue is sky the"
 
 示例 2：
 输入：s = "  hello world  "
 输出："world hello"
 解释：输入字符串可以在前面或者后面包含多余的空格，但是翻转后的字符不能包括。
 
 示例 3：
 输入：s = "a good   example"
 输出："example good a"
 解释：如果两个单词间有多余的空格，将翻转后单词间的空格减少到只含一个。
 
 示例 4：
 输入：s = "  Bob    Loves  Alice   "
 输出："Alice Loves Bob"
 
 示例 5：
 输入：s = "Alice does not even like bob"
 输出："bob like even not does Alice"
  

 提示：
 1 <= s.length <= 104
 s 包含英文大小写字母、数字和空格 ' '
 s 中 至少存在一个 单词
  
 进阶：
 请尝试使用 O(1) 额外空间复杂度的原地解法。
 */

class _51: XCTestCase {

    class Solution {
        
        //进阶：请尝试使用 O(1) 额外空间复杂度的原地解法 - 时间复杂度O(3n), 空间复杂度O(1); 在原来串的基础上挪动; 注意循环的开闭区间
        func reverseWords(_ s: String) -> String {
            if s.isEmpty { return s }
            
            var chs = Array<Character>(s)
            //移除多余的空格(前后所有的空格，中间的单词间只留一个空格)
            removeExtraSpace(&chs);
            //翻转整个字符串
            reverseString(chs: &chs, start: 0, end: chs.count-1)
            //翻转所有单词
            reverseAllWorld(chs: &chs)
            print(chs)
            return String(chs)
        }
        
        func removeExtraSpace(_ chs: inout [Character]){
            //[0, cur)
            var cur = 0
            var idx = 0
            var isSpace = true
    
            while idx < chs.count {
                if chs[idx] == " " {
                    if !isSpace {
                        chs[cur] = chs[idx]
                        cur += 1
                    }
                    idx += 1
                    isSpace = true
                    
                } else {
                    chs[cur] = chs[idx]
                    idx += 1
                    cur += 1
                    isSpace = false
                }
            }
            //如果最后一个是空格, 多+1了
            let newSize = isSpace ? cur-1 : cur
            if newSize < 1 { return }
            chs = Array(chs[0..<newSize])
        }
        //翻转字符串[start,end]
        //held
        func reverseString(chs: inout [Character], start: Int, end: Int) {
            var left = start
            var right = end
            while left < right {
                let tmp = chs[left]
                chs[left] = chs[right]
                chs[right] = tmp
                left += 1
                right -= 1
            }
        }
        
        //翻转所有的单词的解法1:
        //the sky is blue
        //eulb si yks eht
        func reverseAllWorld(chs: inout [Character]) {
            var start = 0
            var end = 0
            
            while start < chs.count {
                end = start
                //查找空格
                while end < chs.count && chs[end] != " " {
                    end += 1
                }
                reverseString(chs: &chs, start: start, end: end-1)
                start = end+1
            }
        }
        
        //翻转所有的单词的解法2:
        //hello world
        func reverseAllWorld2(chs: inout [Character]) {
            var start = 0
            var end = 0
            for i in 0..<chs.count {
                if chs[i] == " " {
                    end = i-1
                    reverseString(chs: &chs, start: start, end: end)
                    start = i+1
                }
                if i == chs.count-1 && start < i {
                    end = i
                    reverseString(chs: &chs, start: start, end: end)
                }
            }
        }
        
        //解法二: 类似于栈
        func reverseWords2(_ s: String) -> String {
            var string = ""
            var strings = [String]()
            for (idx, ch) in s.enumerated() {
                if ch.isWhitespace {
                    if !string.isEmpty {
                        strings.insert(string, at: 0)
                        string.removeAll()
                    }
                    continue
                } else {
                    string.append(ch)
                    if idx == s.count-1 {
                        strings.insert(string, at: 0)
                        string.removeAll()
                    }
                }
            }
            return strings.joined(separator: " ")
        }
    }
    
    func test() {
        let result1 = Solution().reverseWords("the sky is blue")
        let result2 = Solution().reverseWords("hello world  ")
        let result3 = Solution().reverseWords("a good   example")
        let result4 = Solution().reverseWords("  Bob   Loves  Alice   ")
        let result5 = Solution().reverseWords("Alice does not even like bob")
        
        XCTAssert(result1 == "blue is sky the", "case error")
        XCTAssert(result2 == "world hello", "case error")
        XCTAssert(result3 == "example good a", "case error")
        XCTAssert(result4 == "Alice Loves Bob", "case error")
        XCTAssert(result5 == "bob like even not does Alice", "case error")
    }
}
