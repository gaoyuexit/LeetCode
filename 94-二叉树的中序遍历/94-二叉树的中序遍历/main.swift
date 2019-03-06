//
//  main.swift
//  94-二叉树的中序遍历
//
//  Created by apple on 2019/3/2.
//  Copyright © 2019 gaoyu. All rights reserved.
//

import Foundation

/**
 给定一个二叉树，返回它的中序遍历。
 示例:
 输入: [1,null,2,3]
  1
   \
   2
  /
 3
 
 输出: [1,3,2]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
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

// 递归解决方法
//class Solution {
//    func inorderTraversal(_ root: TreeNode?) -> [Int] {
//        var result = [Int]()
//        recursive(root, result: &result)
//        return result
//    }
//
//    func recursive(_ root: TreeNode?, result: inout [Int]) {
//        guard let root = root else { return }
//        recursive(root.left, result: &result)
//        result.append(root.val)
//        recursive(root.right, result: &result)
//    }
//}

// 方法一: 递归解决方法
// 时间复杂度: O(n), 因为递归方法T(n) = 2 * T(n/2) + 1
// 空间复杂度: 最坏情况是O(n), 一般情况是:O(log(n))  其中n是节点的个数
class Solution {
    func inorderTraversalWithRecursive(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        
        func recursive(_ root: TreeNode?) {
            guard let root = root else { return }
            recursive(root.left)
            result.append(root.val)
            recursive(root.right)
        }
        
        recursive(root)
        return result
    }
}


//方法二: 使用Stack的迭代方法
//时间复杂度: O(n)
//空间复杂度: O(n)
struct Stack<T> {
    internal var array = [T]()
    public func isEmpty() -> Bool {
        return array.isEmpty
    }
    public mutating func push(_ node: T) {
        array.append(node)
    }
    public mutating func pop() -> T? {
        return array.popLast()
    }
}

extension Solution {
    func inorderTraversalWithStack(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var stack = Stack<TreeNode>()
        var curr = root
        while curr != nil || !stack.isEmpty() { //如果栈为空，那说明已经全部遍历了
            while curr != nil { //左子树全部装进栈中 循环结束 curr = nil 跳出循环
                stack.push(curr!)
                curr = curr?.left
            }
            if !stack.isEmpty() {  //一直出栈, 如果出栈的元素有右儿子, 将右儿子的所有左子树全部入栈
                curr = stack.pop()
                result.append(curr!.val)
                curr = curr?.right
            }
        }
        return result
    }
}

//方法三: Morris Traversal
//步骤:
//1. 初始化当前点为根节点
//2. 如果当前点不为空
/*
 If current does not have left child
 
 a. Add current’s value
 
 b. Go to the right, i.e., current = current.right
 
 Else
 
 a. In current's left subtree, make current the right child of the rightmost node
 
 b. Go to this left child, i.e., current = current.left
 */

/*
 For example:
 
 
      1
    /   \
   2     3
  / \   /
 4   5 6
 
 First, 1 is the root, so initialize 1 as current, 1 has left child which is 2, the current's left subtree is
 
    2
  /   \
 4     5
 So in this subtree, the rightmost node is 5, then make the current(1) as the right child of 5. Set current = cuurent.left (current = 2). The tree now looks like:
 
     2
   /  \
  4    5
        \
         1
          \
           3
          /
         6
 For current 2, which has left child 4, we can continue with thesame process as we did above
 
    4
     \
      2
       \
        5
         \
          1
           \
            3
           /
          6
 then add 4 because it has no left child, then add 2, 5, 1, 3 one by one, for node 3 which has left child 6, do the same as above. Finally, the inorder taversal is [4,2,5,1,6,3].
 */









