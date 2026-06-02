/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
public func testIterableMin<T>(itT1: Iterable<T>, elementMinExpect: Option<T>): Int64 where T <: Comparable<T> {
    var elementMinActual = min<T>(itT1)
    if (elementMinActual != elementMinExpect) {
        return 1
    }
    return 0
}
