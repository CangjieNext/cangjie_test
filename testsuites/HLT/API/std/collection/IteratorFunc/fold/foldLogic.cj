/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
public func testIterableFold<T, R>(initial: R, operation: (R, T) -> R, itT1: Iterable<T>, expectResult: R): Int64 where R <: Equatable<R> & ToString {
    var foldFunc = fold<T, R>(initial, operation)
    var actualResult = foldFunc(itT1)
    if (!(actualResult is R)) {
        return 1
    }
    if (actualResult != expectResult) {
        return 2
    }
    return 0
}
