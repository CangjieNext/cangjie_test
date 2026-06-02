// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
func f(): Int64 {
    return 0
}

func f(a: Int64): Int64 {
    return 1
}

func f(a: Int32): Int64 {
    return 2
}

func f(a: Int64, b: Int64): Int64 {
    return 3
}

func f(a: Int32, b: Int64): Int64 {
    return 4
}

func f(a: Int64, b: Int32): Int64 {
    return 5
}

func f(a: Int32, b: Int32): Int64 {
    return 6
}

main() {
    var a32: Int32 = 1
    var a64: Int64 = 2

    var sum1 = f() + f(a32) + f(a64)
    var sum2 = f(a32, a32) + f(a64, a64) + f(a32, a64) + f(a64, a32)
    if (sum1 != 3) {
        return 2
    }
    if (sum2 != 18) {
        return 3
    }
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
