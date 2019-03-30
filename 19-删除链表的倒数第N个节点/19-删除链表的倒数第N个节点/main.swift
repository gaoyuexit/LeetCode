//
//  main.swift
//  19-删除链表的倒数第N个节点
//
//  Created by 宇郜 on 2019/3/30.
//  Copyright © 2019 宇郜. All rights reserved.
//

import Foundation

/**
 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。

 示例：
    给定一个链表: 1->2->3->4->5, 和 n = 2.
    当删除了倒数第二个节点后，链表变为 1->2->3->5.
 说明：
    给定的 n 保证是有效的。
 进阶：
    你能尝试使用一趟扫描实现吗？
 
 
 推荐使用方法二:
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//列表长度为L

/**
 方法一:
 找到列表的长度
 该算法对列表进行两次遍历，首先计算列表长度L，然后计算第二个以找到（L-n）个节点。 有2L-n次操作，时间复杂度为O（L）。
 时间复杂度: O(L)
 空间复杂度: O(1)
 */

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head = head else { return nil }
        let dummy = ListNode(0)
        dummy.next = head
        var length = 0
        var first: ListNode? = head
        while first != nil {
            first = first!.next
            length += 1
        }
        length -= n
        first = dummy
        // 遍历到倒数第n个节点的位置
        while length > 0 {
            first = first!.next
            length -= 1
        }
        first!.next = first!.next!.next
        return dummy.next
    }
}




/**
 方法二:
 链表的题目基本上都是优先考虑双指针。一个指针先走N步，然后两个指针同步移动, 后一个指针到链表末尾时候，移除前一个指针所指着的节点即可。但是越简单的题目越要考虑边界条件
 1: 双指针
 2: dummy节点 因为有可能移除的是第一个节点
 
 时间复杂度: O(L)
 空间复杂度: O(1)
 
 */
class Solution1 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head = head else { return nil }
        let dummy = ListNode(0)
        dummy.next = head
        var prev: ListNode? = dummy //第一个指针
        var post: ListNode? = dummy //第二个指针
        //将第二个指针移到第一个指针后N步
        for _ in 0..<n {
            if post == nil { break }
            post = post!.next
        }
        //同时移动前后两个节点
        while post != nil && post?.next != nil {
            prev = prev!.next
            post = post!.next
        }
        //删除节点
        prev!.next = prev!.next!.next
        return dummy.next
    }
}



