//
//  main.swift
//  155-栈-最小栈
//
//  Created by apple on 2019/3/8.
//  Copyright © 2019 gaoyu. All rights reserved.
//

import Foundation

/**
 设计一个支持 push，pop，top 操作，并能在常数时间内检索到最小元素的栈。
 
 push(x) -- 将元素 x 推入栈中。
 pop() -- 删除栈顶的元素。
 top() -- 获取栈顶元素。
 getMin() -- 检索栈中的最小元素。
 
 示例:
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> 返回 -3.
 minStack.pop();
 minStack.top();      --> 返回 0.
 minStack.getMin();   --> 返回 -2.
 
 //题目要求是设计一个栈，用两个栈能解决问题，但就是投机取巧了哈哈。不使用Java中的栈, 自己设计
 //解决思路一
 */

class MinStack {
    
    struct Entity {
        let val: Int
        let min: Int
    }
    
    var stack: [Entity]
    
    /** initialize your data structure here. */
    init() {
        stack = [Entity]()
    }
    
    func push(_ x: Int) {
        let min = getMin()
        if min < x {
            let e = Entity(val: x, min: min)
            stack.append(e)
        } else {
            let e = Entity(val: x, min: x)
            stack.append(e)
        }
    }
    
    func pop() {
        if let _ = stack.last {
            stack.removeLast()
        }
    }
    
    func top() -> Int {
        if let e = stack.last {
            return e.val
        }
        return 0
    }
    
    func getMin() -> Int {
        if let e = stack.last {
            return e.min
        }
        return Int.max
    }
}

let stack = MinStack()
stack.push(-2)
stack.push(0)
stack.push(-3)
print(stack.getMin())
stack.pop()
print(stack.top())
print(stack.getMin())


//方法二: 思路清奇
//class MinStack {
//
//    var minValue = 0
//    var stack = [Int]()
//
//    func push(_ x: Int) {
//        if stack.isEmpty {
//            stack.append(0)
//            minValue = x
//        } else {
//            stack.append(x - minValue)
//            if x < minValue {
//                minValue = x
//            }
//        }
//    }
//
//    func pop() {
//        if stack.isEmpty {
//            return
//        }
//
//        let pop = stack.removeLast()
//
//        if pop < 0 {
//            minValue -= pop
//        }
//    }
//
//    func top() -> Int {
//        guard let top = stack.last else {
//            return 0
//        }
//
//        if top > 0 {
//            return top + minValue
//        } else {
//            return minValue
//        }
//    }
//
//    func getMin() -> Int {
//        return minValue
//    }
//}
