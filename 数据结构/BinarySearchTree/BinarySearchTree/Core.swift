//
//  Core.swift
//  BinarySearchTree
//
//  Created by 宇郜 on 2019/5/16.
//  Copyright © 2019 宇郜. All rights reserved.
//

import Foundation


class Node<E> {
    var element: E
    var left: Node<E>?
    var right: Node<E>?
    var parent: Node<E>?
    
    init(_ element: E, parent: Node<E>?) {
        self.element = element
        self.parent = parent;
    }
}

extension Node {
    var hasTwoChildren: Bool {
        return left != nil && right != nil
    }
    var isLeaf: Bool { //是否是叶子节点
        return left == nil && right == nil
    }
}


protocol TreePrintProtocol {
    func printOfLevelTraversal() //层序遍历
    func printOfPreOrderTraversal()//前序
    func printOfInOrderTraversal()//中序
    func printOfPostOrderTraversal()//后序
}

class Queue<E> { //队列
    var array = [E]()
    
    func enQueue(element: E){
        array.append(element)
    }
    
    func outQueue()->E {
        return array.removeFirst()
    }
    var isEmpty: Bool {
        return array.isEmpty
    }
}
