//
//  Character+LeetCode.swift
//  LeetCodeTests
//
//  Created by 宇郜 on 2021/3/12.
//  Copyright © 2021 gaoyu. All rights reserved.
//

import Foundation

func == (lhs: Character, rhs: String) -> Bool {
    return String(lhs) == rhs
}

extension Character {

    func isDigit() -> Bool {
        switch String(self) {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            return true
        default:
            return false
        }
    }

    func isSpace() -> Bool {
        switch String(self) {
        case " ", "\t", "\n", "\r":
            return true
        default:
            return false
        }
    }

}
