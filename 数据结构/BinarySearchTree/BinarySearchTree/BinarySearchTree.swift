//
//  BinarySearchTree.swift
//  BinarySearchTree
//
//  Created by 宇郜 on 2019/5/16.
//  Copyright © 2019 宇郜. All rights reserved.
//  二叉搜索树

import Foundation


// 比较器
//class Comparator<E>: Equatable {
//    let element: E
//    static func == (lhs: Self, rhs: Self) -> Bool {
//
//    }
//}

/**
 二叉搜索树的接口定义如下:
 */

class BinarySearchTree<E: Comparable>: BinaryTree<E> {
    
    public func add(_ element: E) {
        
        guard let root = root else { //没有根节点
            self.root = Node(element, parent: nil)
            count += 1
            return
        }
        
        //找到需要添加节点的父节点, 和添加到父节点的方向
        var parent = root
        var node: Node<E>? = root
        var cmp = 0
        while node != nil {
            
            cmp = compare(e1: element, e2: node!.element)
            parent = node!
            
            if cmp > 0 {
                node = node?.right
            }else if cmp < 0 {
                node = node?.left
            }else { //相等
                node!.element = element
            }
        }
        
        let newNode = Node(element, parent: parent)
        if cmp > 0 {
            parent.right = newNode
        }else {
            parent.left = newNode
        }
        count += 1
    }
    
    // 删除元素
    public func remove(_ element: E) {
        if var node = getNode(with: element) {
            remove(&node) //删除节点
        }
    }
    
    public func contain(_ element: E) -> Bool {
        return getNode(with: element) != nil
    }
    
    //删除节点
    private func remove(_ node: inout Node<E>) {
        
        count -= 1
        if node.hasTwoChildren { //如果删除的是度为2的节点
            //找该节点的前驱或者后继节点, eg: 后继
            let s = successor(node)
            //用后继节点的值覆盖度为2的节点的值
            node.element = s!.element
            //删除后继节点..., 即删除后续的node节点
            node = s!
        }
        
        //如果是度为1和度为0的节点
        //删除node节点
        
        //应该取代node节点的节点
        let replaceNode = node.left != nil ? node.left! : node.right
        if replaceNode != nil { //度为1
            
            replaceNode!.parent = node.parent
            if node.parent == nil { //node是根节点
                root = replaceNode
                return
            }
            if node === (node.parent!.left ?? nil) { node.parent!.left = replaceNode } //如果要被删除的节点是它父节点的左边
            if node === (node.parent!.right ?? nil) { node.parent!.right = replaceNode } //如果要被删除的节点是它父节点的右边
            
        }else{ //要删除的节点是叶子节点
            if node.parent == nil { //根节点
                root = nil
            }else{ //不是跟节点
                if node === (node.parent!.left ?? nil) { node.parent!.left = nil }
                if node === (node.parent!.right ?? nil) { node.parent!.right = nil }
            }
        }
    }
    
    //根据元素找到节点
    private func getNode(with element: E) -> Node<E>? {
        guard let root = root else { return nil }
        var node: Node<E>? = root
        
        while node != nil {
            let cmp = compare(e1: element, e2: node!.element)
            if cmp > 0 { //向右找
                node = node!.right
            }else if cmp < 0 {
                node = node!.left
            }else {
                return node!
            }
        }
        return nil;
    }
    
    
    // MARK - Private mothed
    // 0:  e1 = e2
    // 1:  e1 > e2
    // -1: e1 < e2
    public func compare(e1: E, e2: E) -> Int {
        if e1 > e2 {
            return 1
        }else if e1 < e2 {
            return -1
        }else {
            return 0
        }
    }
}


/**
    7
  2    5
 1  3   4
 */

extension BinarySearchTree: TreePrintProtocol {
    
    func printOfLevelTraversal() {
        
        guard let root = root else { return }
        
        let queue = Queue<Node<E>>()
        queue.enQueue(root)
        while !queue.isEmpty {
            let node = queue.outQueue()
            print(node.element)
            if let left = node.left { queue.enQueue(left) }
            if let right = node.right { queue.enQueue(right) }
        }
    }
    
    func printOfPreOrderTraversal(){}
    func printOfInOrderTraversal(){}
    func printOfPostOrderTraversal(){}
    
}
