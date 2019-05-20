//
//  main.swift
//  206-反转链表
//
//  Created by 宇郜 on 2019/5/20.
//  Copyright © 2019 宇郜. All rights reserved.
//

import Foundation

/**
 https://leetcode-cn.com/problems/reverse-linked-list/
 反转一个单链表。
 
 示例:
 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 
 dummy 0->1->2->3->4->5
 
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
 */


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Stack<E> {
    var array = [E]()
    
    var count: Int {
        return array.count
    }
    
    func enStack(_ element: E) {
        array.append(element)
    }
    
    func outStack() -> E {
        return array.removeLast()
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
}

/**
 方法一: 使用栈
  0->1->2->3->4->5->NULL
  0->5->4->3->2->1->NULL
 */
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        
        if head == nil { return nil }
        
        let stack = Stack<ListNode>()
        let dummy = ListNode(0) //虚拟头结点
        dummy.next = head
        
        var node = head
        while node != nil {
            stack.enStack(node!)
            node = node!.next
        }
        
        node = dummy
        while !stack.isEmpty() {
            let curr = stack.outStack()
            curr.next = nil
            
            node?.next = curr
            node = curr
        }
        return dummy.next
    }
}



/**
 方法二: 迭代
 1->2->3->4->5->NULL
 

nil <-  1    2
pre    cur   next
 
        1 <- 2   3
      pre  cur  next
 
 
 */
class Solution1 {
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil }
        var cur = head
        var pre: ListNode? = nil
        
        while cur != nil {
            let next = cur!.next
            cur!.next = pre
            pre = cur
            cur = next
        }
        return pre
    }
}


let head = ListNode(1)
let node2 = ListNode(2);
let node3 = ListNode(3);
let node4 = ListNode(4);
let node5 = ListNode(5);
head.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

let newHead = Solution1().reverseList(head)
var newNode = newHead
while newNode != nil {
    print(newNode!.val)
    newNode = newNode!.next
}




