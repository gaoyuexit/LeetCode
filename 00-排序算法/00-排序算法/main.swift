//
//  main.swift
//  00-排序算法
//
//  Created by 宇郜 on 2019/4/7.
//  Copyright © 2019 宇郜. All rights reserved.
//

import Foundation

//让你一看就懂的排序算法（就是这么简单）
//https://blog.csdn.net/weixin_40205234/article/details/86699088



var nums = [6, 3, 8, 2, 9, 1]

class Solution {}

/**
 1: 冒泡排序: https://www.cnblogs.com/shen-hua/p/5422676.html
 N个数字要排序完成，总共进行N-1趟排序，每i趟的排序次数为(N-i)次，
 所以可以用双重循环语句，外层控制循环多少趟，内层控制每一趟的循环次数
 */

extension Solution {
    static func bubbleSort1(_ nums: inout [Int]) -> [Int]{
        guard !nums.isEmpty else { return [] }
        for i in 1..<nums.count {
            for j in 1...nums.count-i {  //注意这里是等于
                if nums[j-1] > nums[j] { //前一个大于后一个数 交换
                   //nums.swapAt(j-1, j) //交换
                    let tmp = nums[j-1]
                    nums[j-1] = nums[j]
                    nums[j] = tmp
                }
            }
        }
        return nums
    }
    
    static func bubbleSort2(_ nums: inout [Int]) -> [Int]{
        for i in 0..<nums.count-1 {
            for j in 0..<nums.count-1-i {
                if nums[j] > nums[j+1] {
                    nums.swapAt(j, j+1)
                }
            }
        }
        return nums
    }
}
print("冒泡排序1结果 -- " + (Solution.bubbleSort1(&nums)).description)
print("冒泡排序2结果 -- " + (Solution.bubbleSort2(&nums)).description)




/**
 2: 选择排序 https://www.cnblogs.com/shen-hua/p/5424059.html
 int[] arr={里面n个数据}；第1趟排序，在待排序数据arr[1]~arr[n]中选出最小的数据，将它与arrr[1]交换；第2趟，在待排序数据arr[2]~arr[n]中选出最小的数据，将它与r[2]交换；以此类推，第i趟在待排序数据arr[i]~arr[n]中选出最小的数据，将它与r[i]交换，直到全部排序完成。
 共进行n-1趟排序
 */

extension Solution {
    static func selectionSort(_ nums: inout [Int]) -> [Int] {
        var k = Int.max //最小的下标值
        for i in 0..<nums.count-1 { //趟数
            k = i
            for j in i..<nums.count {
                if nums[j] < nums[k] {
                    k = j  //最小的下标
                }
            }
            //在内层循环结束，也就是找到本轮循环的最小的数以后，再进行交换
            if k != i {
                nums.swapAt(k, i)
                k = Int.max
            }
        }
        return nums
    }
}

print("选择排序结果 -- " + (Solution.selectionSort(&nums)).description)



/**
 3: 插入排序
 一般来说，插入排序都采用in-place在数组上实现。具体算法描述如下：
 * 从第一个元素开始，该元素可以认为已经被排序；
 * 取出下一个元素，在已经排序的元素序列中从后向前扫描；
 * 如果该元素（已排序）大于新元素，将该元素移到下一位置；
 * 重复步骤3，直到找到已排序的元素小于或者等于新元素的位置；
 * 将新元素插入到该位置后；
 * 重复步骤2~5。
 */
//[6, 3, 8, 2, 9, 1]
extension Solution {
    static func insertionSort(_ nums: inout [Int]) -> [Int] {
        
        var prev = Int.max    //前一个下标
        for i in 1..<nums.count {
            prev = i-1 //前一个下标
            while prev >= 0 && nums[i] < nums[prev] { //前一个值大于当前值
                nums[prev+1] = nums[prev] //向后移动
                prev -= 1
            }
            nums[prev+1] = nums[i]
        }
        
        return nums
    }
}

print("插入排序结果 -- " + (Solution.insertionSort(&nums)).description)




























