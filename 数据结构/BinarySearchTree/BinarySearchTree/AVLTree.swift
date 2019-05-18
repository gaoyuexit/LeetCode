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
 
 
AVL树的添加:
    可能会导致所有祖先节点都失衡
    只要让高度最低的失衡节点恢复平衡, 整颗数就会平衡, 时间复杂度: O(1)
AVL树的删除:
    只可能会导致父节点失衡
    让父节点恢复平衡后, 可能会导致更高层的祖先节点失衡, 最多需要O(logN)次调整
    让父节点恢复平衡, 可能会导致该父节点作为根节点的树的高度 和 原来的树的高度 不同了, 所以可能会导致更高层的祖先节点失衡
 

 搜索: O(logN)
 添加: O(logN), 还需O(1)次的旋转操作
 删除: O(logN), 还需O(logN)次旋转操作
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
        var _node: AVLNode<E>? = (node.parent as? AVLNode<E>)
        
        while _node != nil {
            if _node!.isBalance {// 如果该节点是平衡的  更新高度
                updateHeight(_node!)
            }else{ //不平衡 恢复平衡
                reBalance(_node!)
                //reBalance2(_node!) 两种方式都可以平衡
                break //找到第一个不平衡的节点, 恢复平衡, 整个树就平衡了
            }
            _node = (_node?.parent as? AVLNode<E>)
        }
    }
    
    override func creatNewNode(_ element: E, parent: Node<E>?) -> Node<E> {
        return AVLNode(element, parent: parent)
    }
    
    private func updateHeight(_ node: Node<E>) {
        guard let node = node as? AVLNode<E> else { return }
        node.updateHeight()
    }
    
    /**
     恢复平衡: 方法一: 区分不同的旋转
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
    
    /**
     恢复平衡: 方法二: 四种平衡的方式的结果都是一样的规律
     grand: 为高度最低的那个不平衡节点  grandFather
     
     四种平衡统一后的结果:
                  d
                /   \
               b     f
              / \   / \
             a   c e   g

     */
    private func reBalance2(_ grand: AVLNode<E>) {
        guard let parent = grand.tallerChild() as? AVLNode<E>,
            let node = parent.tallerChild() as? AVLNode<E> else { return }
        
        if parent.isLeftChild { //L
            if node.isLeftChild { //LL
                uniformRotation(r: grand, a: node.left, b: node, c: node.right, d: parent, e: parent.right, f: grand, g: grand.right)
            }else { //LR
                uniformRotation(r: grand, a: parent.left, b: parent, c: node.left, d: node, e: node.right, f: grand, g: grand.right)
            }
        }else{ //R
            if node.isLeftChild { //RL 
                uniformRotation(r: grand, a: grand.left, b: grand, c: node.left, d: node, e: node.right, f: parent, g: parent.right)
            }else { //RR
                uniformRotation(r: grand, a: grand.left, b: grand, c: parent.left, d: parent, e: node.left, f: node, g: node.right)
            }
        }
    }
    
    
    // 对传进来的节点进行左旋转
    // grand需要旋转的节点
    /**
     
     |                          |
     g(左旋)                     p
      \                       /   \
       p             -->     g     n
      / \                    \
     c   n                    c(有可能为null)
         |
         |
        add(n的子树上添加)
     */
    private func rotationLeft(_ grand: AVLNode<E>) {
        let parent = grand.right!
        let child = parent.left
        //更改连线
        grand.right = child
        parent.left = grand
        
        //旋转更改连线之后需要做的事情
        afterRotation(grand: grand, parent: parent, child: child)
    }
    
    
    // 对传进来的节点进行右旋转
    // grand需要旋转的节点
    
    /**
     
            |                          |
            g(右旋)                     p
           /                          /  \
          p             -->          n    g
         / \                             /
        n   c(有可能为null)               c
        |
        |
       add(n的子树上添加)
     */
    
    private func rotationRight(_ grand: AVLNode<E>) {
        let parent = grand.left!
        let child = parent.right
        //更改连线
        grand.left = child
        parent.right = grand
        
        //旋转更改连线之后需要做的事情
        afterRotation(grand: grand, parent: parent, child: child)
    }
    
    
    // 旋转更改连线之后需要做的事情
    private func afterRotation(grand: Node<E>, parent: Node<E>, child: Node<E>?) {
        //让parent成为子树的根节点
        parent.parent = grand.parent
        if grand.isLeftChild {
            grand.parent!.left = parent
        }else if grand.isRightChild {
            grand.parent!.right = parent
        } else { // grand是根节点
            root = parent
        }
        //更新child的parent
        if let child = child {
            child.parent = grand
        }
        //更新grand的parent
        grand.parent = parent
        //更新节点内的高度
        updateHeight(grand)
        updateHeight(parent)
    }
    
    /**
     四种方式的统一的选择
            d
          /   \
         b     f
        / \   / \
       a   c e   g
     
     */
    //r: originRoot 旋转之前的 待旋转的节点 (即旋转之前的子树的根节点)
    typealias N = Node<E>
    private func uniformRotation(r: N, a: N?, b: N, c: N?, d: N, e: N?, f: N, g: N?) {
        //让d成为子树的根节点
        d.parent = r.parent
        if r.isLeftChild {
            r.parent!.left = d
        }else if r.isRightChild {
            r.parent!.right = d
        }else { //
            root = d
        }
        //处理a,b,c
        b.left = a
        b.right = c
        if let a = a {
            a.parent = b
        }
        if let c = c {
            c.parent = b
        }
        updateHeight(b) //更新b的高度
        
        //处理e,f,g
        f.left = e
        f.right = g
        if let e = e {
            e.parent = f
        }
        if let g = g {
            g.parent = f
        }
        updateHeight(f) //更新f的高度
        
        
        //b-d-f
        d.left = b
        d.right = f
        b.parent = d
        f.parent = d
        updateHeight(d) //更新d的高度
    }
    
    
    //删除之后的平衡
    override func afterRemove(_ node: Node<E>) {
        var _node: AVLNode<E>? = (node.parent as? AVLNode<E>)
        
        while _node != nil {
            if _node!.isBalance {// 如果该节点是平衡的  更新高度
                updateHeight(_node!)
            }else{ //不平衡 恢复平衡
                reBalance(_node!)
                //reBalance2(_node!) 两种方式都可以平衡
                // break 这里相对于添加操作的平衡去掉了break, 一直向上找, 是否平衡
            }
            _node = (_node?.parent as? AVLNode<E>)
        }
    }
}
