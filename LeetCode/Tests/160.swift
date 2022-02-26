//
//  160.swift
//  LeetCodeTests
//
//  Created by 郜宇 on 2022/2/26.
//  Copyright © 2022 gaoyu. All rights reserved.
//

import XCTest

/**
 160. 相交链表
 https://leetcode-cn.com/problems/intersection-of-two-linked-lists/
 给你两个单链表的头节点 headA 和 headB ，请你找出并返回两个单链表相交的起始节点。如果两个链表不存在相交节点，返回 null 。
 a1->a2->c1->c2
 b1->b2->b3->c1->c2
 返回c1节点
 
 相同的题: 不用再做了
 剑指 Offer 52. 两个链表的第一个公共节点
 面试题 02.07. 链表相交
 */



class _160: XCTestCase {
    
    /**
     方式一: (推荐)
     a1->a2->c1->c2
     b1->b2->b3->c1->c2
     因为首尾相接，所以他们每一次轮回的路程相等，既 A+B=B+A
     假设两个链表拼接之后, 那么两个链表元素个数相同, 设置两个指针l1,l2分别在两个链表的头结点依次移动, 移动到相同节点, 就是相交节点
     a1->a2->c1->c2拼接  b1->b2->b3->c1->c2
     b1->b2->b3->c1->c2 拼接 a1->a2->c1->c2
     这里是假设拼接的情况:
     我们可以在l1移动过headA所有节点之后,指针指向headB的头结点
     我们可以在l2移动过headB所有节点之后,指针指向headA的头结点
     
     需要注意的是 我们使用的是 !==。
     */
    class Solution {
        func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
            if headA == nil || headB == nil { return nil }
            //两个指针,先指向headA和headB的头结点
            var l1 = headA
            var l2 = headB
            //循环退出条件 (遍历到相等 或者 两个拼接的相同元素个数的链表都遍历完)
            while l1 !== l2 {
                l1 = (l1 == nil) ? headB : l1?.next
                l2 = (l2 == nil) ? headA : l2?.next
            }
            return l1
        }
        
        
        /**
         方法二: hashSet
         循环使用哈希表存储l1的所有结点地址；
         然后再次循环，判断l2是否有结点在哈希表中存在
         */
        /**
         方法三: 遍历两遍,先求两个链表长度, 再使用快慢指针遍历
         获取两个链表的长度 lengthA, lengthB
         让链表中长度大的节点先走 绝对值(lengthA-lengthB) 步，如果长度相等，跳过2
         次数两个链表长度相等，比较 pa === pb 如果相等则找到并返回pa
         返回 nil
         */
        func getIntersectionNode1(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
            if headA == nil || headB == nil { return nil }
            
            //遍历一遍, 求两个链表的长度
            var len1 = 0
            var len2 = 0
            var p1 = headA
            var p2 = headB
            while p1 != nil || p2 != nil {
                if p1 != nil {
                    len1 += 1
                    p1 = p1!.next
                }
                if p2 != nil {
                    len2 += 1
                    p2 = p2!.next
                }
            }
            //长度较长的链表先走(Len长 - Len短)步, 在依次比较
            let isALong = len1 > len2
            let step = isALong ? len1-len2 : len2-len1
            var longP = isALong ? headA : headB
            var shortP = isALong ? headB : headA
            //先走step步
            for _ in 0..<step {
                longP = longP?.next
            }
            while longP !== shortP {
                longP = longP?.next
                shortP = shortP?.next
            }
            return longP
        }
    }

    
    func test() {
        
    }
}
