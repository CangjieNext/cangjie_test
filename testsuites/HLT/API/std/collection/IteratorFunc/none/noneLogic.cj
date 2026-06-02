/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
/*
   Compare the result of the none() function with the input parameter resultExpect.
If the result is the same, 0 is returned. Otherwise, 1 is returned.
 */
public func testIterableNone<T>(itT1: Iterable<T>, predicate: (T) -> Bool, resultExpect: Bool): Int64 where T <: Equatable<T> {
    var noneFunc: (Iterable<T>) -> Bool = none<T>(predicate)
    var noneResult = noneFunc(itT1)
    if (noneResult != resultExpect) {
        return 1
    }
    return 0
}
