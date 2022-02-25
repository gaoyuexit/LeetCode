//
//  2.swift
//  LeetCodeTests
//
//  Created by 宇郜 on 2021/3/16.
//  Copyright © 2021 gaoyu. All rights reserved.
//

import XCTest

/**
 2. 两数相加
 链接：https://leetcode-cn.com/problems/add-two-numbers
 
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
 请你将两个数相加，并以相同形式返回一个表示和的链表。
 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 示例 1：
 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 
 示例 2：
 输入：l1 = [0], l2 = [0]
 输出：[0]
 
 示例 3：
 输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 输出：[8,9,9,9,0,0,0,1]
  

 提示：
 每个链表中的节点数在范围 [1, 100] 内
 0 <= Node.val <= 9
 题目数据保证列表表示的数字不含前导零
 */

class TwoAdd {
    //1: 递归实现
    class func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return _addTwoNumbers(l1, l2, carry: 0)
    }
    
    class func _addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?, carry: Int) -> ListNode? {
        
        guard l1 != nil || l2 != nil else {
            return carry == 0 ? nil : ListNode(carry)
        }
        let value = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
        let node = ListNode(value%10)
        node.next = _addTwoNumbers(l1?.next, l2?.next, carry: value/10)
        return node
    }
    
    //2: 遍历一次实现
    class func addTwoNumbers1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        if l1 == nil && l2 == nil {
            return nil
        }
        
        var value = (l1?.val ?? 0) + (l2?.val ?? 0)
        let head = ListNode(value%10)
        
        
        var next1 = l1?.next
        var next2 = l2?.next
        var carry = value/10
        var node = head
        
        while next1 != nil || next2 != nil || carry != 0 { //注意判断carry是否是=0, 求出链表的长度有可能比两个参数链表长度要长
            value = (next1?.val ?? 0) + (next2?.val ?? 0) + carry
            node.next = ListNode(value%10)
            
            next1 = next1?.next
            next2 = next2?.next
            node = node.next!
            carry = value/10
        }
        
        return head
    }
}

//推荐->虚拟头结点
//示例 1：
//输入：l1 = [2,4,3],
//     l2 = [5,6,4,5]

//输出：     [7,0,8,5]
//解释：342 + 465 = 807.
//
//示例 2：
//输入：l1 = [0], l2 = [0]
//输出：[0]
//
//示例 3：
//输入：l1 = [9,9,9,9,9,9,9],
//     l2 = [9,9,9,9]
//输出：     [8,9,9,9,0,0,0,1]
class _2: XCTestCase {
    
    class Solution {
        func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            if l1 == nil { return nil }
            if l2 == nil { return nil }
            //虚拟头结点
            let dummy = ListNode(0)
            //进位
            var carry = 0
            var l1 = l1
            var l2 = l2
            var preNode = dummy
            while l1 != nil || l2 != nil {
                
//                let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
//                let node = ListNode(sum % 10)
//                carry = sum / 10
//                preNode.next = node
//                preNode = node
//                l1 = l1?.next
//                l2 = l2?.next
                
                var v1 = 0
                if l1 != nil {
                    v1 = l1!.val
                    l1 = l1!.next
                }
                var v2 = 0
                if l2 != nil {
                    v2 = l2!.val
                    l2 = l2!.next
                }
                let sum = v1 + v2 + carry
                carry = sum / 10
                let node = ListNode(sum % 10)
                preNode.next = node
                preNode = node
                
            }
            //检查carry
            if carry > 0 { preNode.next = ListNode(carry) }
            return dummy.next
        }
    }
    
    func testTwoAdd() {
        let head1 = ListNode.create([2,4,3])
        let head2 = ListNode.create([5,6,4])
        let result = Solution().addTwoNumbers(head1, head2)
        XCTAssert(ListNode.print(result) == [7,0,8])
    }
    
    func testTwoAdd1() {
        let head1 = ListNode.create([2,4,3])
        let head2 = ListNode.create([5,6,4])
        let result = Solution().addTwoNumbers(head1, head2)
        XCTAssert(ListNode.print(result) == [7,0,8])
    }
    
    //最终解决方法
    func test() {
        example1()
        example2()
        example3()
    }
    func example1() {
        let head1 = ListNode.create([2,4,3])
        let head2 = ListNode.create([5,6,4])
        let result = Solution().addTwoNumbers(head1, head2)
        XCTAssert(ListNode.print(result) == [7,0,8])
    }
    func example2() {
        let head1 = ListNode.create([0])
        let head2 = ListNode.create([0])
        let result = Solution().addTwoNumbers(head1, head2)
        XCTAssert(ListNode.print(result) == [0])
    }
    func example3() {
        let head1 = ListNode.create([9,9,9,9,9,9,9])
        let head2 = ListNode.create([9,9,9,9])
        let result = Solution().addTwoNumbers(head1, head2)
        XCTAssert(ListNode.print(result) == [8,9,9,9,0,0,0,1])
    }
}
