//
//  main.swift
//  151-翻转字符串里的单词
//
//  Created by 宇郜 on 2019/5/19.
//  Copyright © 2019 宇郜. All rights reserved.
//

import Foundation

/**
 https://leetcode-cn.com/problems/reverse-words-in-a-string/
 给定一个字符串，逐个翻转字符串中的每个单词。
 
 示例 1：
 输入: "the sky is blue"
 输出: "blue is sky the"
 
 示例 2：
 输入: "  hello world!  "
 输出: "world! hello"
 解释: 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 
 示例 3：
 输入: "a good   example"
 输出: "example good a"
 解释: 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
 
 说明：
 无空格字符构成一个单词。
 输入字符串可以在前面或者后面包含多余的空格，但是反转后的字符不能包括。
 如果两个单词间有多余的空格，将反转后单词间的空格减少到只含一个。
 
 进阶：
 请选用 C 语言的用户尝试使用 O(1) 额外空间复杂度的原地解法。
 */



/**
 方式一: C语言解题步骤
      "the sky is blue"
      "eulb si yks eht"
      "blue is sky the"
 */
/*
char* reverseWords(char* s) {
    // 先删除多余空格
    int count = 0;
    int i = 0;
    while(s[count] == ' ' && ++count); // 计数开头的空格
    while(s[count])
    if(s[count] != ' ' || s[count+1] != ' ')
    s[i++] = s[count++];
    else
    s[i] = s[++count];
    s[i] = 0;
    if(s[0] && s[i-1] == ' ') // 末尾可能剩一个空格
    s[i-1] = 0;
    // 单独翻转每个单词
    int l, r;
    i = 0;
    while(s[i]) {
        l = i;
        r = i;
        while(s[r] != ' ' && s[r] != 0 && ++r)
        i = s[r] == ' '? r+1: r;
        while(l < r-1) {
            int temp = s[l];
            s[l++] = s[--r];
            s[r] = temp;
        }
    }
    
    // 翻转整个字符串
    l = 0;
    r = strlen(s) - 1;
    while(l < r) {
        int temp = s[l];
        s[l++] = s[r];
        s[r--] = temp;
    }
    
    return s;
}
*/


//方式二: 语言特性
class Solution {
    func reverseWords(_ s: String) -> String {
       return s.split(separator: " ").reversed().joined(separator: " ")
    }
}

let str = "a good   example"
print(Solution().reverseWords(str))
