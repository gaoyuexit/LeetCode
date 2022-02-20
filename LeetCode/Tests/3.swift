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


// 推荐使用滑动窗口解法
class _3 {
    
    //1.暴力破解法 - 超出时间限制 不推荐
    //abcabcbb:
    //ab->abc->abca (max=3) 下标从a开始遍历, 找到重复的结束, 取最大长度
    //bc->bca->bcab (max=3) 下标从从b开始遍历, 找到重复的结束, 取最大长度
    //ca->cab->cabc (max=3) 下标从从c开始遍历, 找到重复的结束, 取最大长度
    //ab->abc->abcb (max=3) 下标从从a开始遍历, 找到重复的结束, 取最大长度
    //...
    static func lengthOfLongestSubstring0(_ s: String) -> Int {
        
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
    
    //2.滑动窗口法-无重复字符的最长子串
    //双指针
//    let s1 = "abcabcbb"
//    let s2 = "bbbbb"
//    let s3 = "pwwkew"
//    let s4 = ""
//    let s5 = " "
//    let s6 = "abba"
    static func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count < 2 {  return s.count }
        let chs = Array<Character>(s)
        var map = [Character: Int]()
        var maxLen = 0
        //[0,size)
        var start = 0
        for i in 0..<chs.count {
            let char = chs[i]
//            if let preIdx = map[char] { //包含该字符
//                start = max(start, preIdx + 1)   //"abba"的情况, 所以用max()
//                maxLen = max(maxLen, i-start+1)
//                map[char] = i
//            } else { //不包含
//                maxLen = max(maxLen, i-start+1)
//                map[char] = i
//            }
            
            //根据上面注释的代码,缩减代码
            if let preIdx = map[char] { //包含该字符
                start = max(start, preIdx + 1)   //"abba"的情况
            }
            maxLen = max(maxLen, i-start+1)
            map[char] = i
            print("\(chs[0...i])的最长无重复子串长度是\(maxLen), start=\(start)")
        }
        return maxLen
    }
    
    
    //3.动态规划
//    let s1 = "abcabcbb"
    //以ch[0] a结尾的最大长度 = 1
    //以ch[1] b结尾的最大长度 = 2
    //以ch[2] c结尾的最大长度 = 3
    //以ch[3] a结尾的最大长度 = 3 (bca)
    //以ch[4] b结尾的最大长度 = 3 (cab)
    //以ch[5] c结尾的最大长度 = 3 (abc)
    //以ch[6] b结尾的最大长度 = 2 (cb)
    //以ch[7] b结尾的最大长度 = 1 (b)
    /**
     若计算以下标 n 作为结尾的最大不重复子串， 首先要判断第 n 位的字符有没有出现过。 n的范围[0,size-1]
     这时就有两种情况 "存在字符重复"，"字符不重复"    ----> 字符是否重复 使用hashMap [char, int] = [字符,上一个出现时候的下标]
      
     字符不重复：最大子串长度 = 上一位的最大子串长度 + 1
     f(n) = f(n - 1) + 1
                         
     存在字符重复：最大子串长度 = 现在的位置 - 相同字符上一次出现的位置
     f(n) = index - lastIndex

     https://leetcode-cn.com/problems/zui-chang-bu-han-zhong-fu-zi-fu-de-zi-zi-fu-chuan-lcof/solution/java-on-dong-tai-gui-hua-si-lu-qing-xi-z-w2ji/
     https://leetcode-cn.com/problems/zui-chang-bu-han-zhong-fu-zi-fu-de-zi-zi-fu-chuan-lcof/solution/mian-shi-ti-48-zui-chang-bu-han-zhong-fu-zi-fu-d-9/
     */
    //动态规划: -> 时间复杂度为O(2n)
    //字符的 ASCII 码范围为 0 ~ 127 ，哈希表 dic 最多使用 O(128) = O(1) 大小的额外空间。
    //由于返回值是取 dp 列表最大值，因此可借助变量 tmp 存储 dp[j] ，变量 res 每轮更新最大值即可。 下面为再优化的方法
    static func lengthOfLongestSubstring2(_ s: String) -> Int {
        if s.count < 2 {  return s.count }
        let chs = Array<Character>(s)
        var map = [Character: Int]()
        var dp = Array(repeating: 0, count: s.count)
        dp[0] = 1
        map[chs[0]] = 0
        
        for i in 1..<chs.count {
            let ch = chs[i]
            let lastIndex = map[ch] ?? -1
            if lastIndex == -1 { // chs[i]之前没有重复
                dp[i] = dp[i-1] + 1
            } else {
                dp[i] = min(dp[i-1] + 1, i-lastIndex)
            }
            map[ch] = i
            print("\(chs[0...i])的最大长度为\(dp[i])")
        }
        
        var maxLen = 0
        for len in dp {
            if len > maxLen {
                maxLen = len
            }
        }
        return maxLen
    }
    
    //动态规划的优化:
    //由于返回值是取 dp 列表最大值，因此可借助变量 tmp 存储 dp[j] ，变量 res 每轮更新最大值即可。 这里还可以再继续优化
    static func lengthOfLongestSubstring3(_ s: String) -> Int {
        if s.count < 2 {  return s.count }
        let chs = Array<Character>(s)
        //哈希表(数组实现)，存储每个字符最后出现的位置(每次遍历到相同的字符会更新下标)。
        //ASCLL值为0-127，所以hash数组大小为128; 初始为-1(无效下标)，代表 "字符ASCLL值等于下标"的字符 没有出现过
        var hash = Array(repeating: -1, count: 128)
        var maxLen = 1
        var tmpLen = 1
        let first = Int(chs[0].asciiValue ?? 0)
        hash[first] = 0
        for i in 1..<chs.count {
            let ch = chs[i]
            let idx = Int(ch.asciiValue ?? 0)
            let lastIndex = hash[idx]
            if lastIndex == -1 { // chs[i]之前没有重复
                tmpLen = tmpLen + 1
            } else {
                tmpLen = min(tmpLen + 1, i-lastIndex)
            }
            maxLen = max(maxLen, tmpLen)
            hash[idx] = i
            print("\(chs[0...i])的最大长度为\(maxLen)")
        }
        
        return maxLen
    }
}

class _3Test: XCTestCase {


    let s1 = "abcabcbb"
    let s2 = "bbbbb"
    let s3 = "pwwkew"
    let s4 = ""
    let s5 = " "
    let s6 = "abba"

    
    func test() {
        
        let s1_max = _3.lengthOfLongestSubstring(s1)
        let s2_max = _3.lengthOfLongestSubstring(s2)
        let s3_max = _3.lengthOfLongestSubstring(s3)
        let s4_max = _3.lengthOfLongestSubstring(s4)
        let s5_max = _3.lengthOfLongestSubstring(s5)
        let s6_max = _3.lengthOfLongestSubstring(s6)


        print(s1_max)
        print(s2_max)
        print(s3_max)
        print(s4_max)
        print(s5_max)
        print(s6_max)
        
        XCTAssert(s1_max == 3, "case error")
        XCTAssert(s2_max == 1, "case error")
        XCTAssert(s3_max == 3, "case error")
        XCTAssert(s4_max == 0, "case error")
        XCTAssert(s5_max == 1, "case error")
        XCTAssert(s6_max == 2, "case error")

    }
}
