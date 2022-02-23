//
//  203.swift
//  LeetCodeTests
//
//  Created by 郜宇 on 2022/2/23.
//  Copyright © 2022 gaoyu. All rights reserved.
//

import XCTest

/**
 203. 移除链表元素
 https://leetcode-cn.com/problems/remove-linked-list-elements/
 给你一个链表的头节点 head 和一个整数 val ，请你删除链表中所有满足 Node.val == val 的节点，并返回 新的头节点 。
  
 示例 1：
 输入：head = [1,2,6,3,4,5,6], val = 6
 输出：[1,2,3,4,5]

 示例 2：
 输入：head = [], val = 1
 输出：[]
 
 示例 3：
 输入：head = [7,7,7,7], val = 7
 输出：[]
 */

class _203: XCTestCase {
    
    //使用虚拟头结点
    // 0 -> [1,2,6,3,4,5,6]
    // 0 -> [7,7,7,7]
    class Solution {
        func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
            if head == nil { return head }
            let dummy = ListNode(0, head)
            
            var preNode = dummy
            while preNode.next != nil {
                let curNode = preNode.next!
                if curNode.val == val {
                    //删除当前节点curNode, 注意删除就可以,不用再preNode = curNode
                    preNode.next = curNode.next
                } else {
                    preNode = curNode
                }
            }
            return dummy.next
        }
    }
    
    func test() {
        let head1 = ListNode.create([1,2,6,3,4,5,6])
        let newHead1 = Solution().removeElements(head1, 6)
        XCTAssert(ListNode.print(newHead1) == [1,2,3,4,5])

        
        let head2 = ListNode.create([])
        let newHead2 = Solution().removeElements(head2, 1)
        XCTAssert(ListNode.print(newHead2) == [])

        let head3 = ListNode.create([7,7,7,7])
        let newHead3 = Solution().removeElements(head3, 7)
        XCTAssert(ListNode.print(newHead3) == [])
    }
}
