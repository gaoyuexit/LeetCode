//
//  main.swift
//  101-对称二叉树
//
//  Created by 宇郜 on 2019/3/21.
//  Copyright © 2019 宇郜. All rights reserved.
//

import Foundation

/**
 给定一个二叉树，检查它是否是镜像对称的。
 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
 
        1
       / \
      2   2
     / \ / \
    3  4 4  3
 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

        1
       / \
      2   2
       \   \
       3    3
 说明:
 如果你可以运用递归和迭代两种方法解决这个问题，会很加分。
 */

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


/**方法一: 递归
 时间复杂度: O(n) 因为我们遍历整个输入树一次，n是节点的个数
 空间复杂度: 递归调用的数量受树高度的约束。 在最坏的情况下，树是线性的，高度是O(n), 因此，由于栈上的递归调用而导致的空间复杂性最坏的情况下是oO(n)
 
 他们的两个根具有相同的值。
 每棵树的右子树是另一棵树的左子树的镜像反射。
 */
class Solution1 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirror(t1: root, t2: root)
    }
    func isMirror(t1: TreeNode?, t2: TreeNode?) -> Bool {
        if (t1 == nil && t2 == nil) { return true }
        if (t1 == nil || t2 == nil) { return false }
        return t1?.val == t2?.val && isMirror(t1: t1?.left, t2: t2?.right) && isMirror(t1: t1?.right, t2: t2?.left)
    }
}


/** 方法二: 迭代
 使用队列
 1. 现将两个根节点放入
 2. 每次队列里pop出先进入的两个元素, 进行比较, 如果不同, 退出, 说明不是对称二叉树, 如果相同则进行步骤3
 3. 将pop出来的两个元素t1, t2, 队列装入按顺序装入t1.left, t2.right, t1.right, t2.left, 这样每次在队列里pop出的两个元素都是相等的
 */
class Solution2 {
    
    private var array = [TreeNode?]()
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        array.append(root)
        array.append(root)
        while !array.isEmpty {
            let t1 = array.removeFirst()
            let t2 = array.removeFirst()
            if t1 == nil && t2 == nil  { continue }
            if t1 == nil || t2 == nil { return false }
            if t1!.val != t2!.val { return false }
            array.append(t1?.left)
            array.append(t2?.right)
            array.append(t1?.right)
            array.append(t2?.left)
        }
        return true
    }
}

/** 方法三: 层次遍历过程中,检查每一层是不是对称的
 */
