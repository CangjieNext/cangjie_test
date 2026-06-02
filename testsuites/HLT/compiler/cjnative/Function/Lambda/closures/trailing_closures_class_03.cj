/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var a1 = B("a")
    var a2 = B('a')
    if (a1.m != 3) {
        return 1
    }
    if (a2.m != 3) {
        return 1
    }
    return 0
}

open class B {
    public var m: Int64 = 1
    public init(fn: (Int64) -> Int64) {
        m = fn(1)
    }
    public init(x: String) {
        this {x: Int64 => x + 1}
        m = m + 1
    }
    public init(x: Rune) {
        this({x: Int64 => x + 1})
        m = m + 1
    }
}
