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

//稳定性: 如果排序前, 两个相等的元素的前后位置和排序后两个相等的元素的前后位置相同, 则稳定

var nums = [6, 3, 8, 2, 9, 1]

class Solution {}

/**
 1: 冒泡排序: https://www.cnblogs.com/shen-hua/p/5422676.html
 N个数字要排序完成，总共进行N-1趟排序，每i趟的排序次数为(N-i)次，
 所以可以用双重循环语句，外层控制循环多少趟，内层控制每一趟的循环次数
 
 优化:
 如果一趟冒泡, 从头走到尾, 当发现没有元素进行交换的时候, 说明这个序列是完全有序的
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
    //冒泡排序的优化:  如果一趟冒泡, 从头走到尾, 当发现没有元素进行交换的时候, 说明这个序列是完全有序的
    static func bubbleSort3(_ nums: inout [Int]) -> [Int]{
        for i in 0..<nums.count-1 {
            
            var flag = false //是否元素交换过
            
            for j in 0..<nums.count-1-i { //一次冒泡
                if nums[j] > nums[j+1] {
                    nums.swapAt(j, j+1)
                    flag = true
                }
            }
            
            if flag == false {
                break
            }
            
        }
        return nums
    }
}
print("冒泡排序1结果 -- " + (Solution.bubbleSort1(&nums)).description)
print("冒泡排序2结果 -- " + (Solution.bubbleSort2(&nums)).description)
print("冒泡排序3结果 -- " + (Solution.bubbleSort3(&nums)).description)




/**
 2: 选择排序 https://www.cnblogs.com/shen-hua/p/5424059.html
 int[] arr={里面n个数据}；第1趟排序，在待排序数据arr[1]~arr[n]中选出最小的数据，将它与arrr[1]交换；第2趟，在待排序数据arr[2]~arr[n]中选出最小的数据，将它与r[2]交换；以此类推，第i趟在待排序数据arr[i]~arr[n]中选出最小的数据，将它与r[i]交换，直到全部排序完成。
 共进行n-1趟排序

 void selectionSort(int list [], int N) {
    for (i = 0; i< N; i++) {
        //从List[i]到List[N-1]中找最小元, 并将最小元的位置赋值给MinPosition
        MinPosition = ScanForMin(List, i, N-1);
        Swap(List[i], List[MinPosition])
    }
 }
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
 3: 插入排序:  原理和一张张摸扑克牌一样
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
            //nums[i]待插入元素
            nums[prev+1] = nums[i]
        }
        
        return nums
    }
}

print("插入排序结果 -- " + (Solution.insertionSort(&nums)).description)

/**
 4: 快速排序
 //[6, 3, 8, 2, 9, 1]
 a. 从数列中挑出一个元素, 称该元素为`基准`
 b. 扫描一遍数组, 将所有比`基准`小的元素排在基准前面, 所有比`基准`大的元素排在基准后面
 3. 通过递归, 将各个子序列划分为更小的序列, 直到把小于基准值元素的子序列和大于基准值元素的子序列排序
 */

extension Solution {
    static func quickSort(_ nums: inout [Int]) -> [Int] {
        
        
        return nums
    }
}

print("快速排序结果 -- " + (Solution.quickSort(&nums)).description)


/**
 5: 希尔排序:  利用了插入排序的简单, 同时克服了插入排序每次只交换相邻两个元素的缺点
 希尔排序(Shell's Sort)是插入排序的一种又称“缩小增量排序”（Diminishing Increment Sort），是直接插入排序算法的一种更高效的改进版本。希尔排序是非稳定排序算法
 希尔排序是基于插入排序的以下两点性质而提出改进方法的：
    * 插入排序在对几乎已经排好序的数据操作时，效率高，即可以达到线性排序的效率。
    * 但插入排序一般来说是低效的，因为插入排序每次只能将数据移动一位。
 
 原始的希尔排序, 间隔为n/2
 原始的希尔排序:
 //[6, 3, 8, 2, 9, 1]
 a. 取间隔3, 即6和2排序, 3和9排序, 8和1排序, 排序使用插入排序
    [2, 3, 1, 6, 9, 8]
 b. 取间隔3/2=1 , 间隔为1的时候, 就相当于原始的插入排序
 
 希尔排序在插入排序上套了一层 n/2的循环
 */

extension Solution {
    static func shellSort(_ nums: inout [Int]) -> [Int] {
        //for (d=n/2; d>0; d/2) {}
        //for d in stride(from: nums.count/2, to: 1, by: d/2) {}
        var step = nums.count/2
        while step > 0 {
            // 插入排序
            for i in step..<nums.count {
                var prev = i-step //前一个下标
                while prev >= step && nums[i] < nums[prev] { //前一个值大于当前值
                    nums[prev+step] = nums[prev] //向后移动
                    prev -= step
                }
                //nums[i]待插入元素
                nums[prev+step] = nums[i]
            }
            step = step/2
        }
        
        return nums
    }
}

print("希尔排序结果 -- " + (Solution.shellSort(&nums)).description)

























