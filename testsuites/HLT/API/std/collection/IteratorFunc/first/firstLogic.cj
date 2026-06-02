/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
public func testIterableFirst<T>(itT1: Iterable<T>, elementFirstExpect: Option<T>): Int64 where T <: Equatable<T> {
    var elementFirstActual = first<T>(itT1)
    if (elementFirstActual != elementFirstExpect) {
        return 1
    }
    return 0
}
