//
//  AVLTree.swift
//  BinarySearchTree
//
//  Created by 宇郜 on 2019/5/16.
//  Copyright © 2019 宇郜. All rights reserved.
//  AVL树 是 二叉搜索树 自平衡的实现
//  添加元素和删除元素会导致失衡, 要自平衡

import Foundation



/**
 
 向二叉搜索树中, 添加13, 添加13之前,是平衡的. 添加13后导致14,15,9不平衡了
 最坏情况: 导致所有的祖先节点(不包括父节点)都失衡
 但是: 父节点和非祖先节点都不会失衡
 
          9
       /     \
      6      15
     / \     / \
    4   8   14 16
            /
           12
             \
             13
 
 ---------------
 LL - 右旋转(单旋): LL: 表示新添加的节点在 失去平衡的节点的左边的左边
 RR - 左旋转(单旋): RR: 表示新添加的节点在 失去平衡的节点的右边的右边
 ...
 */



class AVLNode<E: Comparable>: Node<E> {
    var height: Int = 1 //当前节点的高度, 在AVL树中要使用, 左右子节点的高度差为平衡因子, 新创建出来的节点肯定是叶子节点, 初始高度为1
    var balanceFactor: Int { //获取该节点的平衡因子
        let leftHeight = left == nil ? 0 : (left as! AVLNode).height
        let rightHeight = right == nil ? 0 : (right as! AVLNode).height
        return leftHeight - rightHeight;
    }
    var isBalance: Bool { //是否平衡
        return abs(balanceFactor) <= 1
    }
    
    func updateHeight() {
        let leftHeight = left == nil ? 0 : (left as! AVLNode).height
        let rightHeight = right == nil ? 0 : (right as! AVLNode).height
        height = 1 + max(leftHeight, rightHeight)  //高度为左右子树最大的高度+1
    }
    
    // 返回该节点的 高度最高的 那个子节点
    func tallerChild() -> Node<E>? {
        let leftHeight = left == nil ? 0 : (left as! AVLNode).height
        let rightHeight = right == nil ? 0 : (right as! AVLNode).height
        if leftHeight > rightHeight { return left }
        if leftHeight < rightHeight { return right }
        return isLeftChild ? left : right  //如果左右子树高度相等, 返回哪个节点都可以, 这里返回和父节点方向相同的方向
    }
}


class AVLTree<E:Comparable>: BinarySearchTree<E> {
    
    override func afterAdd(_ node: Node<E>) {
        var _node: AVLNode<E>? = (node.parent as! AVLNode<E>)
        
        while _node != nil {
            if _node!.isBalance {// 如果该节点是平衡的  更新高度
                _node!.updateHeight()
            }else{ //不平衡 恢复平衡
                reBalance(_node!)
                break //找到第一个不平衡的节点, 恢复平衡, 整个树就平衡了
            }
            _node = (_node?.parent as! AVLNode<E>)
        }
    }
    
    override func creatNewNode(_ element: E, parent: Node<E>?) -> Node<E> {
        return AVLNode(element, parent: parent)
    }
    
    
    /**
     恢复平衡
     grand: 为高度最低的那个不平衡节点  grandFather
     */
    private func reBalance(_ grand: AVLNode<E>) {
        guard let parent = grand.tallerChild() as? AVLNode<E>,
              let node = parent.tallerChild() as? AVLNode<E> else { return }
       
        if parent.isLeftChild { //L
            if node.isLeftChild { //LL
                rotationRight(grand)
            }else { //LR
                rotationLeft(parent)
                rotationRight(grand)
            }
        }else{ //R
            if node.isLeftChild { //RL
                rotationRight(parent)
                rotationLeft(grand)
            }else { //RR
                rotationLeft(grand)
            }
        }
    }
    
    
    // 对某个节点进行左旋转
    private func rotationLeft(_ node: AVLNode<E>) {
        
    }
    
    // 对某个节点进行右旋转
    private func rotationRight(_ node: AVLNode<E>) {
        
    }
}
