//
//  main.swift
//  232-用栈实现队列
//
//  Created by apple on 2019/3/11.
//  Copyright © 2019 gaoyu. All rights reserved.
//

import Foundation

/**
 使用栈实现队列的下列操作：
 push(x) -- 将一个元素放入队列的尾部。
 pop() -- 从队列首部移除元素。
 peek() -- 返回队列首部的元素。
 empty() -- 返回队列是否为空。
 
 示例:
 MyQueue queue = new MyQueue();
 
 queue.push(1);
 queue.push(2);
 queue.peek();  // 返回 1
 queue.pop();   // 返回 1
 queue.empty(); // 返回 false
 
 说明:
 * 你只能使用标准的栈操作 -- 也就是只有 push to top, peek/pop from top, size, 和 is empty 操作是合法的。
 * 你所使用的语言也许不支持栈。你可以使用 list 或者 deque（双端队列）来模拟一个栈，只要是标准的栈操作即可。
 * 假设所有操作都是有效的 （例如，一个空的队列不会调用 pop 或者 peek 操作）。
 */

struct Stack<T> {
    private var array = [T]()
    public mutating func push(_ element: T) {
        self.array.append(element)
    }
    public mutating func pop() -> T {
        return array.removeLast()
    }
    public func size() -> Int {
        return array.count
    }
    public func isEmpty() -> Bool {
        return array.isEmpty
    }
    public func top() -> T? {
        return array.last
    }
}

//https://leetcode.com/problems/implement-queue-using-stacks/solution/
// 推荐使用方法二

// 方法一: 两个堆栈 push - O(n)  pop - O(1)
// 为了满足队列的FIFO属性，我们需要保留两个堆栈。它们用于反转元素的到达顺序，其中一个以最终顺序存储队列元素。
// 将最新元素推到堆栈的底部。为此，我们首先将所有s1元素传输到辅助堆栈s2。然后将新到达的元素推到顶部，s2并弹出所有元素并将其推送到s1。
// push - O(n)  pop - O(1)    s2为空的辅助栈, 只有Push的时候, 将s1倒入到s2, 新元素放入到s1的栈底, 再s2倒回到s1


class MyQueue {
    private var s1 = Stack<Int>()
    private var s2 = Stack<Int>()
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        if s1.isEmpty() {
            s1.push(x)
            return;
        }
        while !s1.isEmpty() {
            s2.push(s1.pop())
        }
        s1.push(x)
        while !s2.isEmpty() {
            s1.push(s2.pop())
        }
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        return s1.pop()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        return s1.top() ?? -1
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return s1.isEmpty()
    }
}

var queue = MyQueue()
queue.push(1)
queue.push(2)
print(queue.peek()) // 返回 1
print(queue.pop()) // 返回 1
print(queue.empty()) // 返回 false


// 方法二: 两个堆栈 push - O(1)  pop - O(1)
// push-全部存到s1栈中, push多次, s1中就有多个
// pop-将当前s1中的元素全部逆序导入到s2中, s2 pop最后一个
// 后续的多次pop, 只要s2不为空就在s2中 pop最后一个


class MyQueue2 {
    
    private var s1 = Stack<Int>()
    private var s2 = Stack<Int>()
    private var front = -1 //返回队列首部的元素
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        if s1.isEmpty() { front = x }
        s1.push(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        if s2.isEmpty() {
            while !s1.isEmpty() {
                s2.push(s1.pop())
            }
        }
        return s2.pop()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        if !s2.isEmpty() {
            return s2.top() ?? -1
        }else {
            return front
        }
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return s1.isEmpty() && s2.isEmpty()
    }
}





