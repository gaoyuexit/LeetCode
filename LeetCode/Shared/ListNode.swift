//
//  ListNode.swift
//  LeetCodeTests
//
//  Created by 宇郜 on 2021/3/12.
//  Copyright © 2021 gaoyu. All rights reserved.
//

import Foundation

class ListNode: CustomDebugStringConvertible {

    public var val: Int
    public var next: ListNode?

    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    var debugDescription: String {
        var s = "\(val)"
        var p = self
        while p.next != nil {
            p = p.next!
            s = "\(s) \(p.val)"
        }
        return s
    }
}

extension ListNode {
    static func create(_ array: [Int]) -> ListNode? {
        if array.isEmpty { return nil }
        let headNode: ListNode = ListNode(array[0])
        var preNode: ListNode? = headNode
        for i in 1..<array.count {
            let node = ListNode(array[i])
            preNode?.next = node
            preNode = node
        }
        return headNode
    }
    
    static func print(_ head: ListNode?) -> [Int] {
        guard let head = head else { return [] }
        var result = [Int]()
        
        var p = head
        result.append(head.val)
        
        while p.next != nil {
            p = p.next!
            result.append(p.val)
        }
        return result
    }
}
