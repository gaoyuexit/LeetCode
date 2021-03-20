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
