//
//  LeetCoder.swift
//  LeetCode
//
//  Created by fknm on 2019/6/21.
//  Copyright © 2019年 supernano. All rights reserved.
//

import Foundation

public class ListNode {
    
    public var val: Int
   
    public var next: ListNode?
 
    public init(_ val: Int) {

        self.val = val

        self.next = nil

    }
}

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
    
    static func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil {
            return l2
        }
        
        if l2 == nil {
            return l1
        }
        var newNode: ListNode? = nil
        var newNode1 = l1
        var newNode2 = l2
        if newNode1!.val < newNode2!.val {
            newNode = newNode1
            newNode1 = newNode1?.next
        } else {
            newNode = newNode2
            newNode2 = newNode2?.next
        }
        
        var tempNode = newNode
        while (newNode1 != nil) && (newNode2 != nil) {
            if newNode1!.val <= newNode2!.val {
                tempNode?.next = newNode1
                newNode1 = newNode1?.next
            } else {
                tempNode?.next = newNode2
                newNode2 = newNode2?.next
            }
            tempNode = tempNode?.next
        }
        
        if newNode1 != nil && newNode2 == nil {
            tempNode?.next = newNode1
        }
        
        if newNode1 == nil && newNode2 != nil {
            tempNode?.next = newNode2
        }
        
        return newNode
    }
    
    static func mergeTwoLists1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 == nil {
            return nil
        }
        
        if l1 == nil || l2 == nil {
            return l1 == nil ? l2 : l1
        }
        
        var newNode: ListNode? = nil
        
        if l1!.val <= l2!.val {
            newNode = l1
            newNode?.next = mergeTwoLists(l1?.next, l2)
        } else {
            newNode = l2
            newNode?.next = mergeTwoLists(l1, l2?.next)
        }
        return newNode
    }
    
    static func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 || nums.count == 1 {
            return nums.count
        }
        
        var size = 0
        for i in 0..<nums.count {
            if nums[i] != nums[size] {
                size += 1
                nums[size] = nums[i]
            }
        }
        return size + 1
    }
    
    static func removeDuolicatesForVal(_ nums: inout [Int], val: Int) -> Int {
        if nums.count == 0 || nums.count == 1 {
            return nums.count
        }
        
        var i = 0
        for j in 0..<nums.count {
            if nums[j] != val {
                nums[i] = nums[j]
                i += 1
            }
        }
        
        return i
    }
}
