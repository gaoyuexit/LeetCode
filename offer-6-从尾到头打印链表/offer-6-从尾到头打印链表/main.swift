//
//  main.swift
//  offer-6-从尾到头打印链表
//
//  Created by 宇郜 on 2019/3/28.
//  Copyright © 2019 宇郜. All rights reserved.
//

import Foundation

/**
 题目: 输入一个链表的头节点, 从尾到头反过来打印出每个节点的值
 */


/**
 思路: 遍历链表, 最后一个最先打印, 明显的是先进后出, 使用栈结构体
 因为递归本质上也是一个栈结构, 所以可以有两种实现方式: 递归和循环
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

var pHead = ListNode(1)
var p2 = ListNode(2)
var p3 = ListNode(3)
var p4 = ListNode(4)
pHead.next = p2
p2.next = p3
p3.next = p4

/**
 方法一: 循环
 */
class Solution {
    private var array = [Int]() //用数组当做栈
    
    func printReverseNode(_ head: ListNode?) {
        var pNode = head
        while pNode != nil {
            array.append(pNode!.val)
            pNode = pNode!.next
        }
        while !array.isEmpty {
            print(array.popLast()!)
        }
    }
}

/**
 方法二: 递归
 */
class Solution1 {
    func printReverseNode(_ head: ListNode?) {
        if head != nil {
            printReverseNode(head!.next)
            print(head!.val)
        }
    }
}


//print(Solution().printReverseNode(pHead))

print(Solution1().printReverseNode(pHead))














