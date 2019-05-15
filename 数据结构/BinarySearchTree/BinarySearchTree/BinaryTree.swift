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


