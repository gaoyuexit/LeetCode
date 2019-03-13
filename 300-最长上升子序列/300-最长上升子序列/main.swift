//
//  main.swift
//  300-最长上升子序列
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019 gaoyu. All rights reserved.
//

import Foundation

//Longest Increasing Subsequence : LIS
//给定一个无序的整数数组，找到其中最长上升子序列的长度。
/**
 1.示例:
 输入: [10,9,2,5,3,7,101,18]
 输出: 4
 解释: 最长的上升子序列是 [2,3,7,101]，它的长度是 4。
 
 2.说明:
 可能会有多种最长上升子序列的组合，你只需要输出对应的长度即可。
 你算法的时间复杂度应该为 O(n2) 。

 3.进阶: 你能将算法的时间复杂度降低到 O(n log n) 吗?
 */

/**
 1、子序列：不要求连续子序列，只要保证元素前后顺序一致即可；
 2、上升：这里的“上升”是“严格上升”，类似于 [2, 3, 3, 6, 7] 这样的子序列是不符合要求的；
 */

//LIS(i) 表示以第 i 个数字为结尾的最长上升子序列的长度
//状态转移方程: LIS(i) = max( LIS(j) + 1  if j<i and nums[i] > nums[j] )



//https://blog.csdn.net/u013309870/article/details/75193592
//动态规划算法的两种形式:
//求解的方式有两种：①自顶向下的备忘录法(递归) ②自底向上(循环累加)


//方法＃1暴力[超出时间限制] 不写

//方法二: 动态规划 自顶向下的备忘录法(递归)
class Solution {
    
    private var map = [Int:Int]() //下标:最长长度
    
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.isEmpty { return 0 }
        var res = 1
        for i in 0..<nums.count {
            res = max(res, searchLIS(nums, index: i))
        }
        return res
    }
    
    //根据下标, 返回当前下标最长的子序列长度
    func searchLIS(_ nums: [Int], index: Int) -> Int {
        if index == 0 { return 1 }
        
        if let length = map[index] {
            return length
        }
        
        var res = 1
        for i in 0..<index { //遍历index之前的下标所对应的长度
            if nums[index]  > nums[i] {
                res = max(res, searchLIS(nums, index: i) + 1)
            }
        }
        map[index] = res
        return res
    }
}

// 方法三: 动态规划 自底向上(循环累加) O(n^2)
class Solution2 {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var dp = [Int:Int]()
        for i in 0..<nums.count {
            dp[i] = 1
            for j in 0..<i {
                if nums[i] > nums[j] {
                    dp[i] = max(dp[i]!, 1+(dp[j]!))
                }
            }
        }
        return dp.values.max() ?? 1
    }
}

// 方法三: 动态规划+二分查找实现 O(nlogn)
/**
 假设存在一个序列d[1..9] = 2 1 5 3 6 4 8 9 7，可以看出来它的LIS长度为5。
 下面一步一步试着找出它。
 我们定义一个序列B，然后令 i = 1 to 9 逐个考察这个序列。
 此外，我们用一个变量Len来记录现在最长算到多少了
 
 首先，把d[1]有序地放到B里，令B[1] = 2，就是说当只有1一个数字2的时候，长度为1的LIS的最小末尾是2。这时Len=1
 
 然后，把d[2]有序地放到B里，令B[1] = 1，就是说长度为1的LIS的最小末尾是1，d[1]=2已经没用了，很容易理解吧。这时Len=1
 
 接着，d[3] = 5，d[3]>B[1]，所以令B[1+1]=B[2]=d[3]=5，就是说长度为2的LIS的最小末尾是5，很容易理解吧。这时候B[1..2] = 1, 5，Len＝2
 
 再来，d[4] = 3，它正好加在1,5之间，放在1的位置显然不合适，因为1小于3，长度为1的LIS最小末尾应该是1，这样很容易推知，长度为2的LIS最小末尾是3，于是可以把5淘汰掉，这时候B[1..2] = 1, 3，Len = 2
 
 继续，d[5] = 6，它在3后面，因为B[2] = 3, 而6在3后面，于是很容易可以推知B[3] = 6, 这时B[1..3] = 1, 3, 6，还是很容易理解吧？ Len = 3 了噢。
 
 第6个, d[6] = 4，你看它在3和6之间，于是我们就可以把6替换掉，得到B[3] = 4。B[1..3] = 1, 3, 4， Len继续等于3
 
 第7个, d[7] = 8，它很大，比4大，嗯。于是B[4] = 8。Len变成4了
 
 第8个, d[8] = 9，得到B[5] = 9，嗯。Len继续增大，到5了。
 
 最后一个, d[9] = 7，它在B[3] = 4和B[4] = 8之间，所以我们知道，最新的B[4] =7，B[1..5] = 1, 3, 4, 7, 9，Len = 5。
 
 于是我们知道了LIS的长度为5。
 
 !!!!! 注意。这个1,3,4,7,9不是LIS，它只是存储的对应长度LIS的最小末尾。有了这个末尾，我们就可以一个一个地插入数据。虽然最后一个d[9] = 7更新进去对于这组数据没有什么意义，但是如果后面再出现两个数字 8 和 9，那么就可以把8更新到d[5], 9更新到d[6]，得出LIS的长度为6。
 
 然后应该发现一件事情了：在B中插入数据是有序的，而且是进行替换而不需要挪动——也就是说，我们可以使用二分查找，将每一个数字的插入时间优化到O(logN)~~~~~于是算法的时间复杂度就降低到了O(NlogN)～！
 */

class Solution3 {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        //var dp = [Int:Int]()  //dp存储的对应长度LIS的最小末尾 可以用字典, 也可以用数组  (字典->长度:最小末尾)  (数组->下标:最小末尾)  dp为升序
        var dp = [Int]()
        dp.append(nums[0])
        for i in 1..<nums.count {
            if nums[i] > dp.last! { //如果此值比dp的最后一个大, 此值排在后面
                dp.append(nums[i])
            }else{//如果此值比dp中最后一个小, 此值替换dp中第一个比该值大的位置( 在升序数组中查找第一个比此值大的下标, 可以用二分法) //注意相等的情况
                let index = dp.firstIndex{ $0 >= nums[i] } ?? 0
                dp[index] = nums[i]
            }
        }
        return dp.count
    }
}

var nums = [4,10,4,3,8,9]

print(Solution3().lengthOfLIS(nums))
























