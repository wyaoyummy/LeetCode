//
//  LeetCoder.swift
//  LeetCode
//
//  Created by fknm on 2019/6/21.
//  Copyright © 2019年 supernano. All rights reserved.
//

import Foundation

struct LeetCoder {
    
    /// 最长共有字符串
    ///
    /// - Parameter strs: 字符创数组 [leetCode, leetC, leet, lee]
    /// - Returns: 共有字符串
    static func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0{
            return ""
        } else if strs.count == 1 {
            return strs.first!
        } else {
            var result = strs.first!
            
            for i in 1..<strs.count {
                let stri = strs[i]
                
                while !stri.hasPrefix(result) {
                    result = String(result.prefix(result.count - 1))
                    if result.isEmpty {
                        return ""
                    }
                }
            }
            return result
        }
    }
    
    static func longestCommonPrefix1(_ strs: [String]) -> String {
        if strs.count == 0{
            return ""
        } else if strs.count == 1 {
            return strs.first!
        } else {
            var result = ""
            for (index, a) in strs.first!.enumerated() {
                for str in strs[1..<strs.count] {
                    if index < str.count {
                        if a != str[str.index(str.startIndex, offsetBy: index)] {
                            return result
                        }
                    } else {
                        return result
                    }
                }
                result.append(a)
            }
            return result
        }
    }
    
    static func isValid(_ s: String) -> Bool {
        var cStrArr = [Character]()
        for c in s {
            switch c {
            case "(","{","[":
                cStrArr.append(c)
            case ")" :
                guard (!cStrArr.isEmpty && cStrArr.removeLast() == "(") else {
                    return false
                }
            case "}" :
                guard (!cStrArr.isEmpty && cStrArr.removeLast() == "{") else {
                    return false
                }
            case "]" :
                guard (!cStrArr.isEmpty && cStrArr.removeLast() == "[") else {
                    return false
                }
            default:
                break
            }
        }
        return cStrArr.isEmpty
    }
    
}
