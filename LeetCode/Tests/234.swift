//
//  234.swift
//  LeetCodeTests
//
//  Created by 郜宇 on 2022/2/27.
//  Copyright © 2022 gaoyu. All rights reserved.
//

import XCTest

/**
 234. 回文链表
 https://leetcode-cn.com/problems/palindrome-linked-list/
 给你一个单链表的头节点 head ，请你判断该链表是否为回文链表。如果是，返回 true ；否则，返回 false 。
 示例 1：
 输入：head = [1,2,2,1]
 输出：true
 
 示例 2：
 输入：head = [1,2]
 输出：false
  
 提示：
 链表中节点数目在范围[1, 105] 内
 0 <= Node.val <= 9
 
 进阶：你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？ 如果要求不能破坏链表的原来结构呢？
 
 
 回文:  (常存在于字符串/链表), 从左读和从右读, 是一样的值  1->2->2->1, 左右读都是1221     1->2->3->2->1也是回文,  中间节点是对称的
 
 一样的题目(做一个就够了, 两个答案一样): 面试题02.06. 回文链表
 
 链表的判断是双指针(快慢), 单指针, 循环的条件是curNode != nil还是curNode.next != nil
 */
class _234: XCTestCase {
    
    class Solution {
        /**
         题解: O(n) 时间复杂度和 O(1) 空间复杂度, 破坏链表的原来结构(如果想不破坏, 翻转之后再翻转回来拼接上就可以了)
         1: 找到中间节点 1->2->3->2->1  中间3 ,  1->2->2->1  中间节点:第一个2
         2: 翻转右半部分(中间节点的右边部分)
         3:1->2->3->2->1   和   左边: 1->2->3 ,  右边1->2->nil,   依次比较值
         */
         
        func isPalindrome(_ head: ListNode?) -> Bool {
            //[], [5], 这样的链表也是回文链表
            guard let head = head,
                  let sec = head.next else {
                    return true
            }
            //[1,1] 这样的链表也是回文链表
            if sec.next == nil { return head.val == sec.val }
            //中间节点
            let mid = findMid(head)
            //翻转右侧链表
            var rHead: ListNode? = reverList(mid.next!)
            var lHead: ListNode? = head
                        
            //依次比较 1->2->3->2->1   和   左边: 1->2->3 ,  右边1->2->nil,
            while rHead != nil {
                if lHead?.val != rHead?.val { return false }
                lHead = lHead?.next
                rHead = rHead?.next
            }
            return true
        }
        
        /**
         找到中间节点（右半部分链表头结点的前一个节点）
         比如1>2>3>2>1中的3是中间节点
         比如1>2>2>1中 左边第一个2是中间节点
         */
        func findMid(_ head: ListNode) -> ListNode {
            //快慢指针寻找中间节点
            var slow = head
            var fast = head
            
            while fast.next != nil && fast.next?.next != nil {
                slow = slow.next!
                fast = fast.next!.next!
            }
            return slow
        }
        
        /**
         翻转链表
         head: 原链表的头结点  中间节点的下一个
         retrun: 翻转之后链表的头节点
         */
        // 0->2->1->nil   0->1->2->nil
        func reverList(_ head: ListNode) -> ListNode {
            
            var curNode: ListNode? = head
            var preNode: ListNode? = nil
            while curNode != nil {
                let nextNode = curNode!.next
                curNode!.next = preNode
                preNode = curNode
                curNode = nextNode
            }
            return preNode!
        }
        
    }
    func test() {
        let head1 = ListNode.create([1,2,2,1])
        XCTAssert(Solution().isPalindrome(head1) == true)
        
        let head2 = ListNode.create([1,2])
        XCTAssert(Solution().isPalindrome(head2) == false)
    }
}
