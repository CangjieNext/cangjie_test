/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var c: Int32 = 0

class R {
    public func funca(a: Int32): Int32 {
        c = 10 + a
        return 0
    }

    public static var b: (Int32) -> Int32 = {a: Int32 => 0}

    public R(a: Int32) {
    }
}

main(): Int64 {
    var d = R.b
    d(1)
    if (c == 0) {
        R.b = R(2).funca
        d = R.b
        d(0)
    }

    return Int64(c - 10)
}
