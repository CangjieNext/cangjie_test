/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public func testIterableAll<T>(itT1: Iterable<T>, predicate: (T) -> Bool, resultExpect: Bool): Int64 where T <: Equatable<T> {
    var allFunc = all<T>(predicate)
    var allResult = allFunc(itT1)
    if (allResult != resultExpect) {
        return 1
    }
    return 0
}
