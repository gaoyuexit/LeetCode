//
//  19.swift
//  LeetCodeTests
//
//  Created by 郜宇 on 2022/4/16.
//  Copyright © 2022 gaoyu. All rights reserved.
//

import XCTest

/**
 19. 删除链表的倒数第 N 个结点
 https://leetcode-cn.com/problems/remove-nth-node-from-end-of-list/
 给你一个链表，删除链表的倒数第 n 个结点，并且返回链表的头结点。
 示例 1：
 输入：head = [1,2,3,4,5], n = 2
 输出：[1,2,3,5]
 
 示例 2：
 输入：head = [1], n = 1
 输出：[]
 
 示例 3：
 输入：head = [1,2], n = 1
 输出：[1]

 链表中结点的数目为 sz
 1 <= sz <= 30
 0 <= Node.val <= 100
 1 <= n <= sz
 */

class _19: XCTestCase {

    class Solution {
        func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
            
            if head == nil { return nil }
            
            let dummy = ListNode(0, head)
            
            var fast: ListNode? = dummy
            var slow: ListNode? = dummy
            
            //快指针先走n步
            for _ in 0..<n {
                fast = fast?.next
            }
            
            while fast?.next != nil {
                slow = slow?.next
                fast = fast?.next
            }
            //fast是最后一个结点, slow.next是将要删除的结点
            slow?.next = slow?.next?.next
            return dummy.next
        }
    }
    
    func test() {
        XCTAssert(ListNode.print(Solution().removeNthFromEnd(ListNode.create([1,2,3,4,5]), 2)) == [1,2,3,5])
        XCTAssert(ListNode.print(Solution().removeNthFromEnd(ListNode.create([1]), 1)) == [])
        XCTAssert(ListNode.print(Solution().removeNthFromEnd(ListNode.create([1,2]), 1)) == [1])
    }
}
