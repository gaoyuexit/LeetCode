//
//  BinaryTree.swift
//  BinarySearchTree
//
//  Created by 宇郜 on 2019/5/16.
//  Copyright © 2019 宇郜. All rights reserved.
//

import Foundation

class BinaryTree<E: Comparable> {
    
    internal var count = 0 //结点个数
    internal var root: Node<E>? //根节点
    
    public func size() -> Int {
        return count
    }
    
    public func isEmpty() -> Bool {
        return count == 0
    }
    
    public func clear() {
        root = nil
        count = 0
    }
    
    //找前驱节点
    internal func predecessor(_ node: Node<E>) -> Node<E>? {
        var p = node.left
        if p != nil { //后继节点在右子树的 左左左
            while p!.right != nil {
                p = p!.right
            }
            return p!
        }
        // 从父节点, 祖父节点中寻找前驱节点
        var _node: Node<E>? = node
        while _node?.parent != nil && _node === _node?.parent!.left {
            _node = _node?.parent
        }
        return _node?.parent
    }
    
    //找后继节点
    internal func successor(_ node: Node<E>) -> Node<E>? {
        
        var p = node.right
        if p != nil { //后继节点在右子树的 左左左
            while p!.left != nil {
                p = p!.left
            }
            return p!
        }
        // 从父节点, 祖父节点中寻找后继节点
        var _node: Node<E>? = node
        while _node?.parent != nil && _node === _node?.parent!.right {
            _node = _node?.parent
        }
        return _node?.parent
    }
}




extension BinaryTree {
    
    //判断二叉树是否是完全二叉树
    func isComplete() -> Bool {
        
        return true
    }
    
    // 返回二叉树的高度
    func height() -> Int {
        guard let root = root else { return 0 }
        var height = 0 //数的高度
        var levelSize = 1 //每一层元素的数量
        let queue = Queue<Node<E>>()
        queue.enQueue(root)
        
        while !queue.isEmpty {
            let node = queue.outQueue()
            levelSize -= 1
            
            if let left = node.left { queue.enQueue(left) }
            if let right = node.right { queue.enQueue(right) }
            
            if levelSize == 0 { //即将访问下一层
                levelSize = queue.size
                height += 1
            }
        }
        return height
    }
}


/**
          7
        2    5
       1 3  4
 */

extension BinaryTree: TreePrintProtocol {
    
    //层序遍历
    func printOfLevelTraversal() {
        
        guard let root = root else { return }
        var levelSize = 1 //每一层元素的数量
        
        let queue = Queue<Node<E>>()
        queue.enQueue(root)
        while !queue.isEmpty {
            let node = queue.outQueue()
            print(node.element)
            levelSize -= 1
            
            if let left = node.left { queue.enQueue(left) }
            if let right = node.right { queue.enQueue(right) }
            
            if levelSize == 0 { //即将访问下一层
                levelSize = queue.size
                print("-----------------------")
            }
        }
    }
    
    /*
          4
        /   \
       2     7
      / \   / \
     1   3 6   9
 
 */
    //前序遍历
    func printOfPreOrderTraversal(_ node: Node<E>?){
        guard let node = node else { return }
        print(node.element)
        printOfPreOrderTraversal(node.left)
        printOfPreOrderTraversal(node.right)
    }
    
    //中序遍历
    func printOfInOrderTraversal(_ node: Node<E>?) {
        guard let node = node else { return }
        printOfInOrderTraversal(node.left)
        print(node.element)
        printOfInOrderTraversal(node.right)
    }
    
    //后续遍历
    func printOfPostOrderTraversal(_ node: Node<E>?) {
        guard let node = node else { return }
        printOfPostOrderTraversal(node.left)
        printOfPostOrderTraversal(node.right)
        print(node.element)
    }
}
