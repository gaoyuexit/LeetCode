//
//  main.swift
//  88-合并两个有序数组
//
//  Created by 宇郜 on 2019/5/18.
//  Copyright © 2019 宇郜. All rights reserved.
//

import Foundation

/**
 https://leetcode-cn.com/problems/merge-sorted-array/
 给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。
 说明:
    初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
    你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
 示例:
    输入:
    nums1 = [1,2,3,0,0,0], m = 3
    nums2 = [2,5,6],       n = 3
 
    输出: [1,2,2,3,5,6]
 */

// 方法一: 在新数组上排列
class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var result = [Int]()
        var i = 0, j = 0
        
        while i < m && j < n {
            if nums1[i] < nums2[j] {
                result.append(nums1[i])
                i += 1
            }else {
                result.append(nums2[j])
                j += 1
            }
        }
        if i < m {
            result.append(contentsOf: nums1[i..<m])
        }
        if j < n {
            result.append(contentsOf: nums2[j..<n])
        }
        nums1 = result
    }
}

// 方法二: 直接在原数组上操作, 从后向前遍历比较大小
/*
class Solution1 {
    public void merge(int[] nums1, int m, int[] nums2, int n) {
        int i = m - 1;
        int j = n - 1;
        int k = m + n - 1;
        while (i >= 0 && j >= 0) {
            if (nums1[i] > nums2[j]) {
                nums1[k--] = nums1[i--];
            } else {
                nums1[k--] = nums2[j--];
            }
        }
        while (j >= 0) {
            nums1[k--] = nums2[j--];
        }
    }
}
*/


var num1 = [1,2,3]
var num2 = [2,5,6]
Solution().merge(&num1, 3, num2, 3)
print(num1)


