//
//  TreeNode.swift
//  LeetCodeTests
//
//  Created by 宇郜 on 2021/3/12.
//  Copyright © 2021 gaoyu. All rights reserved.
//

import Foundation

class TreeNode: CustomDebugStringConvertible {
    var value = 0
    var leftNode: TreeNode?
    var rightNode: TreeNode?

    init(_ value: Int = 0, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.value = value
        self.leftNode = left
        self.rightNode = right
    }

    fileprivate func printTree(_ tree: TreeNode) -> String {
        var s = ""
        if let l = tree.leftNode {
            s = "l=\(printTree(l))"
        }
        if let r = tree.rightNode {
            s = "\(s), r=\(printTree(r))"
        }

        if s.isEmpty {
            return "\(tree.value):-"
        } else {
            return "\(tree.value):( \(s) )"
        }
    }

    var debugDescription: String {
        return printTree(self)
    }
}

