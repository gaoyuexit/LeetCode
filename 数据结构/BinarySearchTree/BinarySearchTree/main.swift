//
//  main.swift
//  BinarySearchTree
//
//  Created by 宇郜 on 2019/5/12.
//  Copyright © 2019 宇郜. All rights reserved.
//  

import Foundation

/**
            7
        4      9
     2    5   8  11
    1 3            12
 */

//前序遍历: 7,4,2,1,3,5,9,8,11,12
//中序遍历: 1,2,3,4,5,7,8,9,11,12

//http://520it.com/binarytrees/  测试网站

/************************二叉搜索树**************************/
func test_BinarySearchTree() {
    let tree = BinarySearchTree<Int>()
    let datas = [7, 4, 9, 2, 5, 8, 11, 3, 12, 1]
    for e in datas {
        tree.add(e)
    }
//    tree.remove(7)
//    tree.printOfLevelTraversal()
    tree.printOfInOrderTraversal(tree.root)
    print("🌲的高度为: " + tree.height().description)
}


/************************AVL树**************************/
func test_AVLTree() {
    let tree = AVLTree<Int>()
    let datas = [85,19,69,3,7,99,95]
    for e in datas {
        tree.add(e)
    }
    
    tree.remove(99)
    tree.remove(85)
    tree.remove(95)
    
    tree.printOfLevelTraversal()
}

/********************************main*********************************/

test_BinarySearchTree()
//test_AVLTree()







