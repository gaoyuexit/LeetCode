//
//  main.swift
//  2-Add Two Numbers
//
//  Created by apple on 2018/9/21.
//  Copyright © 2018年 gaoyu. All rights reserved.
//

import Foundation


/**
 
 You are given two non-empty linked lists representing two non-negative integers.
 The digits are stored in reverse order and each of their nodes contain a single digit.
 Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 
 //Explanation: 342 + 465 = 807.
 
 //两个链表从前向后相同深度的相加, 逢10进1
 */

// 因为两个链表每一位都进行一样的操作, 所以可以考虑递归或者循环的去做, 注意处理两个链表节点个数不同的情况

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return addTwoNumbers(l1, l2, carry: 0)
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?, carry: Int) -> ListNode? {
        
        guard l1 != nil || l2 != nil else {
            return carry == 0 ? nil : ListNode(carry)
        }
        let value = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
        let list = ListNode(value%10)
        list.next = addTwoNumbers(l1?.next, l2?.next, carry: value/10)
        return list
    }
}

let pL1 = ListNode(2)
let pL2 = ListNode(4)
let pL3 = ListNode(3)
pL1.next = pL2
pL2.next = pL3
pL3.next = nil

let qL1 = ListNode(5)
let qL2 = ListNode(6)
let qL3 = ListNode(4)
qL1.next = qL2
qL2.next = qL3
qL3.next = nil


var result = Solution().addTwoNumbers(pL1, qL1)

while(result != nil) {
    print(result!.val)
    result = result?.next
}


















