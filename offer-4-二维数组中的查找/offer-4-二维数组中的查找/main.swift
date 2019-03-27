//
//  main.swift
//  offer-4-二维数组中的查找
//
//  Created by 宇郜 on 2019/3/27.
//  Copyright © 2019 宇郜. All rights reserved.
//

import Foundation

/**
 题目: 在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组
 和一个整数，判断数组中是否含有该整数。
 
 思路:
    首先选取数组中右上角的数字。如果该数字等于要查找的数字，查找过程结束；如果该数字大于要查找的数组，剔除这个数字所在的列；如果该数
 字小于要查找的数字，剔除这个数字所在的行。也就是说如果要查找的数字不在数组的右上角，则每一次都在数组的查找范围中剔除一行或者一列，这
 样每一步都可以缩小查找的范围，直到找到要查找的数字，或者查找范围为空。
 */


let nums = [
            [1, 2, 8, 9],
            [2, 4, 9, 12],
            [4, 7, 10, 13],
            [6, 8, 11, 15]
        ]
//10
class Solution {
    func searchNumber(_ nums: [[Int]], target: Int, rows: Int, columns: Int) -> Bool {
        guard !nums.isEmpty, rows > 0, columns > 0 else { return false }
        var row = 0
        var column = columns - 1
        
        while row < rows && column > 0  {
            if nums[row][column] == target { return true }
            if nums[row][column] > target {
                column -= 1
            }else {
                row += 1
            }
        }
        return false
    }
}

print(Solution().searchNumber(nums, target: 3, rows: 4, columns: 4))
