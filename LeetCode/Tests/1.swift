//
//  1.swift
//  LeetCodeTests
//
//  Created by 宇郜 on 2021/3/12.
//  Copyright © 2021 gaoyu. All rights reserved.
//

import XCTest

/**
 给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 的那 两个 整数，并返回它们的数组下标。
 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。
 你可以按任意顺序返回答案。

 示例 1：
 输入：nums = [2,7,11,15], target = 9
 输出：[0,1]
 解释：因为 nums[0] + nums[1] == 9 ，返回 [0, 1] 。
 
 示例 2：
 输入：nums = [3,2,4], target = 6
 输出：[1,2]
 
 示例 3：
 输入：nums = [3,3], target = 6
 输出：[0,1]
 
 提示：

 2 <= nums.length <= 103
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 只会存在一个有效答案

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/two-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class TwoSum {
    
    class func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 1 else { return [] }
        var hashTable = [Int: Int]();
        for(i, num) in nums.enumerated() {
            //other number
            //eg: 2 = 9 - 7  other need 2, 2 in hash Table?
            let other = target - num;
            if let otherIndex = hashTable[other] {
                return [otherIndex, i]
            }else{
                hashTable[num] = i
            }
        }
        return []
    }
}

class TwoSumTest: XCTestCase {

    let case0 = [2, 4, 6, 7, 8]
    let case1 = [2, 7, 11, 15]
    let case2 = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]

    func testTwoSum0() {
        let result0 = TwoSum.twoSum(case0, 9)
        XCTAssert(result0.count == 2 && case0[result0.first!] + case0[result0.last!] == 9, "case0 error")
    }
    
}


// 暴力方法需要两次循环以此相加进行比较, 如果将nums装进一个字典中, 字典是个哈希表, 取值为O(1), 直接遍历一次数组nums即可, 看看需要的另外的值是否在字典中(O(1)),
// 方式一: 先遍历一遍将nums中的下标和值放到字典中, 在遍历一次nums数组比较, 是否和为target
// 方式二: 因为是nums中的两个数的值为target, 所以num[0]+num[1]=target 或者 num[1]+num[0]=target 这两种都是正确的, 所以可以只遍历一次数组, 看看另外的一个需要的值是否在字典中, 如果不在就讲下标和值放入到字典中, 因为target需要的数组中的两个值, 返回的时候返回 [otherIndex, i], 因为otherIndex是先放进字典的下标,比较小
