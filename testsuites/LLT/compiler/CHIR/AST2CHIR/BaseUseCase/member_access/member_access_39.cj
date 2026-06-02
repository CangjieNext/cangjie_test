// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableO2 %n.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var c: Int32 = 0

struct R {
    public func funca(a: Int32): Int32 {
        c = 10 + a
        return 0
    }

    public var b: (Int32) -> Int32

    public init() {
        b = {
            a: Int32 =>
            c = 10 + a
            0
        }
    }

    public init(a: Int32) {
        this()
        b = funca
    }
}

main(): Int64 {
    var d = R(3).b
    if (d(3) == 0) {
        return Int64(c - 13)
    }
    return 1
}
