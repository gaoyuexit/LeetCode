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



let tree = BinarySearchTree<Int>()

let datas = [7, 4, 9, 2, 5, 8, 11, 3, 12, 1]

for e in datas {
    tree.add(e)
}

tree.remove(7)

tree.printOfLevelTraversal()
print("🌲的高度为: " + tree.height().description)
