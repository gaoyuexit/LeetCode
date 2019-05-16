//
//  main.swift
//  21-合并两个有序链表
//
//  Created by 宇郜 on 2019/5/16.
//  Copyright © 2019 宇郜. All rights reserved.
//

import Foundation

//https://leetcode-cn.com/problems/merge-two-sorted-lists/solution/
/*
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 示例：
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 */


/**
 归并排序的合并操作:
 1. 取出两个链表中的第一个元素，对比大小，小元素的放在前面节点，然后取小元素的下一个对比另一个链表中的元素 当任意一个链表为空时，另外一个非空链表的最后一个元素设置为最末节点
 
 2.首先找到开头val值最小的链表，并以此作为整链，将另一条链表依次插入到最小链表中，其中链表坐标慢慢往后移。
 
 3.递归
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0)  //引入虚拟头结点 处理比较简单
        var cur = dummyHead
        var _l1 = l1
        var _l2 = l2
        
        while _l1 != nil && _l2 != nil {
            if _l1!.val < _l2!.val {
                cur.next = _l1
                cur = cur.next!
                _l1 = _l1!.next
            }else{
                cur.next = _l2
                cur = cur.next!
                _l2 = _l2!.next
            }
        }
        if _l1 == nil {
            cur.next = _l2
        }else{
            cur.next = _l1
        }
        return dummyHead.next
    }
}


