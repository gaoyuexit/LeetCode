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


//http://520it.com/binarytrees/  测试网站

/************************二叉搜索树**************************/
func test_BinarySearchTree() {
    let tree = BinarySearchTree<Int>()
    let datas = [7, 4, 9, 2, 5, 8, 11, 3, 12, 1]
    for e in datas {
        tree.add(e)
    }
    tree.remove(7)
    tree.printOfLevelTraversal()
    print("🌲的高度为: " + tree.height().description)
}


/************************AVL树**************************/
func test_AVLTree() {
    let tree = AVLTree<Int>()
    let datas = [33, 55, 38, 91, 83, 81, 99, 62, 13, 11, 63, 69]
    for e in datas {
        tree.add(e)
    }
    tree.printOfLevelTraversal()
}



/********************************main*********************************/


//test_BinarySearchTree()
test_AVLTree()










