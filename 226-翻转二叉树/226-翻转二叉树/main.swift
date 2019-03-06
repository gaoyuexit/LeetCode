//
//  main.swift
//  226-翻转二叉树
//
//  Created by apple on 2019/3/5.
//  Copyright © 2019 gaoyu. All rights reserved.
//

import Foundation

/**
 输入：
 
        4
      /   \
     2     7
    / \   / \
   1   3 6   9
 
 输出：
        4
      /   \
     7     2
    / \   / \
   9   6 3   1
 
 */

 //Definition for a binary tree node.
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


//方法一: 递归
//这是一个经典的树问题，最适合递归方法。
//由于树中的每个节点仅被访问一次，因此时间复杂度为O(n) 其中n是树中的节点数。我们不能做得更好，因为至少我们必须访问每个节点来反转它。
//因为递归, 在最坏的情况下, O(h)函数调用将被放置在堆栈中, h是树的高度, 因为 h ∈ O(n), 所以空间复杂度为O(n)

//递归每个节点的left和right
class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        let right = self.invertTree(root.right)
        let left = self.invertTree(root.left)
        root.left = right
        root.right = left
        return root
    }
}

//方法二: 迭代
//或者，我们可以以类似于广度优先搜索的方式迭代地解决问题。
//我们的想法是，我们需要交换树中所有节点的左右子节点。 因此，我们创建了一个队列来存储左右孩子尚未交换的节点。 最初，只有根位于队列中。 只要队列不为空，就从队列中删除下一个节点，交换其子节点，然后将子节点添加到队列中。 空节点未添加到队列中。 最终，队列将为空并且所有子项都交换，我们返回原始根。
//由于树中的每个节点仅被访问/添加到队列一次，因此时间复杂度为O(n)  n是树中的节点数。
//空间复杂度为O(n) 因为在最坏的情况下，队列将包含二叉树的一个级别中的所有节点。 对于完整的二叉树，叶级别具有n/2 = O(n) 水平
// 层次遍历，每遍历到一个结点，就将该结点下的子节点交换。
extension Solution {
    func invertTreeWithIteration(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        var queue = [TreeNode]()
        queue.append(root)
        while !queue.isEmpty {
            let current = queue.removeFirst()
            let tmp = current.left //交换队列中左右子节点
            current.left = current.right
            current.right = tmp
            
            if current.left != nil { queue.append(current.left!) }
            if current.right != nil { queue.append(current.right!) }
        }
        return root
    }
}




















