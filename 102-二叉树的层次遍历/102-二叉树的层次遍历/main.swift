//
//  main.swift
//  102-二叉树的层次遍历
//
//  Created by apple on 2019/3/6.
//  Copyright © 2019 gaoyu. All rights reserved.
//

import Foundation

//给定一个二叉树，返回其按层次遍历的节点值。 （即逐层地，从左到右访问所有节点）。
/**
 例如:
 给定二叉树: [3,9,20,null,null,15,7],
        3
       / \
      9  20
        /  \
       15   7
 

 返回其层次遍历结果：
 [
 [3],
 [9,20],
 [15,7]
 ]
*/

//利用队列实现二叉树的层次遍历
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        guard let root = root else { return result }
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            var levelResult = [Int]() //每一层的结果
            var count = queue.count
            while count > 0 {
                let node = queue.removeFirst()
                levelResult.append(node.val)
                if node.left != nil { queue.append(node.left!) }
                if node.right != nil { queue.append(node.right!) }
                count -= 1
            }
            result.append(levelResult)
        }
        return result
    }
}


