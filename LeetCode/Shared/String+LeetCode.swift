//
//  String+LeetCode.swift
//  LeetCodeTests
//
//  Created by 宇郜 on 2021/3/12.
//  Copyright © 2021 gaoyu. All rights reserved.
//

import Foundation

extension String {

    subscript (i: Int) -> Character? {
        if i > count - 1 || i < 0 {
            return .none
        }
        let index: Index = self.index(startIndex, offsetBy: i)
        return self[index]
    }

    mutating func popBack() -> String {
        remove(at: index(startIndex, offsetBy: count - 1))
        return self
    }

}
