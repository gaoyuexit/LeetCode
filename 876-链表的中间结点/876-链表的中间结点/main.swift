//
//  main.swift
//  876-链表的中间结点
//
//  Created by 宇郜 on 2019/5/19.
//  Copyright © 2019 宇郜. All rights reserved.
//

import Foundation

/**
 https://leetcode-cn.com/problems/middle-of-the-linked-list/
 给定一个带有头结点 head 的非空单链表，返回链表的中间结点。
 如果有两个中间结点，则返回第二个中间结点。
 
 输入：[1,2,3,4,5] 返回的结点值为 3
 输入：[1,2,3,4,5,6] 输出：此列表中的结点 4
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


//方法一: 遍历一遍链表, 将链表的每个元素放到数组中, 返回数组中间的元素
//时间复杂度: O(n), 空间复杂度: O(n)
class Solution1 {
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        var result = [ListNode]()
        var node: ListNode? = head
        while node != nil{
            result.append(node!)
            node = node!.next
        }
        return result[result.count >> 1];
    }
}



// 方法二: 快慢指针, 一个指针是另一个指针速度的两倍;
// 时间复杂度: O(n), 空间复杂度: O(1)

/*
 输入：[1,2,3,4,5] 返回的结点值为 3
 输入：[1,2,3,4,5,6] 输出：此列表中的结点 4
 */
class Solution2 {
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        var fast = head
        var slow = head
        
        while fast.next != nil && fast.next!.next != nil {
            fast = fast.next!.next!
            slow = slow.next!
        }
        return fast.next == nil ? slow : slow.next
    }
}
