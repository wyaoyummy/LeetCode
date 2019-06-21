//
//  ArrayExtension.swift
//
//  Created by fknm on 2017/6/21.
//  Copyright © 2017年 fknm. All rights reserved.
//

import Foundation

extension Array {
    // 去重
    func filterDoubleElements<E: Equatable>(_ filter: (Element) -> E) -> [Element] {
        var result = [Element]()
        for value in self {
            let key = filter(value)
            if !result.map({filter($0)}).contains(key) {
                result.append(value)
            }
        }
        return result
    }
}
