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

public struct BB {
    public func test(a: Int64) {
        return a
    }
    static let degree: Int64
    static init() {
        degree = 180
    }
}

public var a = BB()

main() {
    var res = a.test(0) + BB.degree - 180
    return res
}
