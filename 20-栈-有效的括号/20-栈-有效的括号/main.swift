//
//  main.swift
//  20-栈-有效的括号
//
//  Created by apple on 2019/3/8.
//  Copyright © 2019 gaoyu. All rights reserved.
//

import Foundation

/**
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
 有效字符串需满足：
 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。
 
 示例 1:
 输入: "()"
 输出: true

 示例 2:
 输入: "()[]{}"
 输出: true

 示例 3:
 输入: "(]"
 输出: false
 
 示例 4:
 输入: "([)]"
 输出: false

 示例 5:
 输入: "{[]}"
 输出: true
 */

/**
 初始化栈 S。
 一次处理表达式的每个括号。
 如果遇到开括号，我们只需将其推到栈上即可。这意味着我们将稍后处理它，让我们简单地转到前面的 子表达式。
 如果我们遇到一个闭括号，那么我们检查栈顶的元素。如果栈顶的元素是一个 相同类型的 左括号，那么我们将它从栈中弹出并继续处理。否则，这意味着表达式无效。
 如果到最后我们剩下的栈中仍然有元素，那么这意味着表达式无效。
 */

class Solution {
    var hashMap = ["(":")", "[":"]", "{": "}"]
    var stack = [String]()
    
    func isValid(_ s: String) -> Bool {
        for c in s {
            let cStr = "\(c)"
            if hashMap.keys.contains(cStr) { //左括号
                stack.append(cStr)
            }else{//右括号
                //不为空,并且栈顶和该元素对应
                guard let last = stack.last,
                          hashMap[last] == cStr else { return false }
                stack.removeLast()
            }
        }
        return stack.isEmpty
    }
}

print(Solution().isValid("[(())]"))

