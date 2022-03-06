//
//  15.swift
//  LeetCodeTests
//
//  Created by 郜宇 on 2022/3/6.
//  Copyright © 2022 gaoyu. All rights reserved.
//

import XCTest

/**
 15. 三数之和
 https://leetcode-cn.com/problems/3sum/
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有和为 0 且不重复的三元组。
 注意：答案中不可以包含重复的三元组。
 示例 1：
 输入：nums = [-1,0,1,2,-1,-4]
 输出：[[-1,-1,2],[-1,0,1]]

 示例 2：
 输入：nums = []
 输出：[]

 示例 3：
 输入：nums = [0]
 输出：[]
  
 提示：
 0 <= nums.length <= 3000
 -105 <= nums[i] <= 105
 */

class _15: XCTestCase {
    
    /**
     解题1: 暴力法 枚举每一个三元组 时间复杂度0(n^3) 空间复杂度0(1)
     定义三个指针,来移动
     */
    
    /**
     题解2: 暴力法的优化(最佳答案)
     时间复杂度0(n^2) 空间复杂度0(1)
     
     1: 先对数组进行排序: nlogn复杂度  [-4,-1,-1,0,1,2]
     2: 定义三个下标变量: i, l, r;   固定i的位置,l和r移动,进行判断; 然后i++,再继续移动l和r;
     3: i = 0, l=1, r=count-1,  如果i+l+r > 0 则 r--;  如果i+l+r<0则l++; 如果l>r,  则i++, l和r重置状态;
     4: i = 1, l=2, r=count-1,  如果i+l+r > 0 则 r--;  如果i+l+r<0则l++; 如果l>r,  则i++, l和r重置状态;
     5: ...
     6: 如果i + l + r = 0; 保存结果;  看看同一个i下, 是否还有不同的l和r;  l++, r--;
     7: 注意: [-4,-1,-1,0,1,2], 如果 i如果指向第一个-1时, 当i++的时候, 如果指向的值还是-1, 则跳过; 避免了重复三元组也提高了效率
     
     //[0,sortNums.count-3] i的范围
     */
    
    class Solution {
        func threeSum(_ nums: [Int]) -> [[Int]] {
            if nums.count < 3 { return [] }
            var result = [[Int]]()
            let sortNums = nums.sorted()
            var l = 0
            var r = 0
            //[0,sortNums.count-3]
            for i in 0...sortNums.count-3 {
                l = i+1
                r = sortNums.count-1
                
                //[-4,-1,-1,0,1,2] 跳过相同的-1
                if i > 0 && sortNums[i] == sortNums[i-1] {
                    continue
                }
                
                while l < r {
                    if sortNums[i] + sortNums[l] + sortNums[r] > 0 {
                        r = r-1
                    } else if sortNums[i] + sortNums[l] + sortNums[r] < 0 {
                        l = l+1
                    } else { //三数之和=0
                        result.append([sortNums[i],sortNums[l],sortNums[r]])
                        //跳过重复的元素 //eg: [-2,0,0,2,2]
                        while l < r && sortNums[l] == sortNums[l+1] {
                            l += 1
                        }
                        while l < r && sortNums[r] == sortNums[r-1] {
                            r -= 1
                        }
                        
                        l += 1
                        r -= 1
                    }
                }
            }
            return result
        }
    }
    
    func test() {
        XCTAssert(Solution().threeSum([-1,0,1,2,-1,-4]) == [[-1,-1,2],[-1,0,1]])
        XCTAssert(Solution().threeSum([]) == [])
        XCTAssert(Solution().threeSum([0]) == [])
        XCTAssert(Solution().threeSum([-2,0,0,2,2]) == [[-2,0,2]]) //注意: 不是[[-2,0,2],[-2,0,2]]
    }
}
