//
//  86.swift
//  LeetCodeTests
//
//  Created by 郜宇 on 2022/2/26.
//  Copyright © 2022 gaoyu. All rights reserved.
//

import XCTest

/**
 86. 分隔链表
 https://leetcode-cn.com/problems/partition-list/
 给你一个链表的头节点 head 和一个特定值 x ，请你对链表进行分隔，使得所有 小于 x 的节点都出现在 大于或等于 x 的节点之前。
 你应当 保留 两个分区中每个节点的初始相对位置。

 如果分割成三部分如何做呢? [小于x][等于x][大于x] [1,2,2,3,4,5]
 
 示例 1：
 输入：head = [1,4,3,2,5,2], x = 3
 输出：[1,2,2,4,3,5]
 
 示例 2：
 输入：head = [2,1], x = 2
 输出：[1,2]
  
 提示：
 链表中节点的数目在范围 [0, 200] 内
 -100 <= Node.val <= 100
 -200 <= x <= 200
 
 相似题目: 面试02.04. 分割链表
 */

class _86: XCTestCase {
    
    class Solution {
        //思路: 使用lHead和lTail, rHead和rTail表示两个链表(两个链表为了方便,可以使用两个dummy节点),
        //     遍历一遍链表, 符合条件的分别链接到两个链表当中, 最终串联起来
        //     最终的返回lHead(虚拟头节点).next
        func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
            if head == nil { return nil }
            
            //表示两个链表的指针
            let lHead = ListNode(0)
            var lTail = lHead
            let rHead = ListNode(0)
            var rTail = rHead
            var cur = head //用于遍历链表
            while cur != nil {
                if cur!.val < x { //比x小的,放在lTail的后面
                    lTail.next = cur
                    lTail = cur!
                } else { //比x大的,放在rTail的后面
                    rTail.next = cur
                    rTail = cur!
                }
                cur = cur!.next
            }
            //这句代码不能少 因为可能出现这样的情况： 原链表倒数第N个节点A的值是>=X的，A后面所有节点的值都是<x的
            rTail.next = nil
            //拼接两个链表
            lTail.next = rHead.next
            
            return lHead.next
        }
    }
    
    func test() {
        let head1 = ListNode.create([1,4,3,2,5,2])
        let result1 = Solution().partition(head1, 3)
        XCTAssert(ListNode.print(result1) == [1,2,2,4,3,5])
        
        let head2 = ListNode.create([2,1])
        let result2 = Solution().partition(head2, 2)
        XCTAssert(ListNode.print(result2) == [1,2])
    }

}
