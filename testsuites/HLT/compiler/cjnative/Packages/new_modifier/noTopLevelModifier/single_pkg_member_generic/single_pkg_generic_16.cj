/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler  %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

public struct BB<T> {
    public func test(a: T) {
        return a
    }
    static let degree: Int64
    static init() {
        degree = 180
    }
}

public var a = BB<Int64>()

main() {
    var res = a.test(0) + BB<Int64>.degree - 180
    return res
}
