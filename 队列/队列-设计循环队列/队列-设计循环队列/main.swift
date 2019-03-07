//
//  main.swift
//  队列-设计循环队列
//
//  Created by apple on 2019/3/7.
//  Copyright © 2019 gaoyu. All rights reserved.
//  https://leetcode-cn.com/explore/learn/card/queue-stack/216/queue-first-in-first-out-data-structure/865/

import Foundation

/**
 * Your MyCircularQueue object will be instantiated and called as such:
 * let obj = MyCircularQueue(k)
 * let ret_1: Bool = obj.enQueue(value)
 * let ret_2: Bool = obj.deQueue()
 * let ret_3: Int = obj.Front()
 * let ret_4: Int = obj.Rear()
 * let ret_5: Bool = obj.isEmpty()
 * let ret_6: Bool = obj.isFull()
 
 MyCircularQueue(k): 构造器，设置队列长度为 k 。
 Front: 从队首获取元素。如果队列为空，返回 -1 。
 Rear: 获取队尾元素。如果队列为空，返回 -1 。
 enQueue(value): 向循环队列插入一个元素。如果成功插入则返回真。
 deQueue(): 从循环队列中删除一个元素。如果成功删除则返回真。
 isEmpty(): 检查循环队列是否为空。
 isFull(): 检查循环队列是否已满。
 
 例如: 数组下标从0开始计算
 设置 head tail初始值为-1
 满的情况: head  tail
 0   4
 1   0
 2   1
 3   2
 4   3
 0   4
 
 (tail + 1) % size == head
 */

class MyCircularQueue {
    
    private var datas = [Int:Int]()
    private let size: Int
    private var head: Int = -1
    private var tail: Int = -1
    
    /** Initialize your data structure here. Set the size of the queue to be k. */
    init(_ k: Int) {
        size = k
    }
    
    /** Insert an element into the circular queue. Return true if the operation is successful. */
    func enQueue(_ value: Int) -> Bool {
        if isFull() { return false }
        if isEmpty() { head = 0 }
        tail = (tail+1) % size
        datas[tail] = value
        return true
    }
    /** Delete an element from the circular queue. Return true if the operation is successful. */
    
    func deQueue() -> Bool {
        if isEmpty() { return false }
        if head == tail {
            head = -1
            tail = -1
            return true
        }
        head = (head+1) % size
        return true
    }
    /** Get the front item from the queue. */
    
    func Front() -> Int {
        if isEmpty() { return -1 }
        return datas[head]!
    }
    /** Get the last item from the queue. */
    
    func Rear() -> Int {
        if isEmpty() { return -1 }
        return datas[tail]!
    }
    
    /** Checks whether the circular queue is empty or not. */
    
    func isEmpty() -> Bool {
        return head == -1
    }
    /** Checks whether the circular queue is full or not. */
    
    func isFull() -> Bool {
        return (tail + 1) % size == head
    }
}

let queue = MyCircularQueue(3)
_ = queue.enQueue(1)
_ = queue.enQueue(2)
_ = queue.enQueue(3)
let result = queue.enQueue(4)
_ = queue.deQueue()
print(result)





