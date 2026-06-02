// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %n.%suffix
// EXEC: %run %n.%suffix 2>&1 | compare %f
// ASSERT: scan 101
// ASSERT: scan 102
// ASSERT: scan 103

unsafe main() {
    var f: CFunc<() -> Int8> = { => Int8(0) }
    var arr = Array<CFunc<() -> Int8>>(3, repeat: f)
    var f1: CFunc<() -> Int8> = { =>
        println(101)
        Int8(1)
    }
    var f2: CFunc<() -> Int8> = { =>
        println(102)
        Int8(2)
    }
    var f3: CFunc<() -> Int8> = { =>
        println(103)
        Int8(3)
    }
    arr[0] = f1
    arr[1] = f2
    arr[2] = f3
    var sum: Int8 = 0
    for (i in 0..3) {
        sum += arr[i]()
    }
    if (sum == 6) {
        return 0
    }
    return 1
}
