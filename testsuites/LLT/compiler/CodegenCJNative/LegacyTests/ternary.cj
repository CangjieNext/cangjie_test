// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func ark_ternary(a: Int32, b: Int32): Int32 {
    let c: Int32 = if (a == 40) {
        a + b
    } else {
        b
    }
    return c
}

func codegenUnitTest(): Int32 {
    return ark_ternary(40, 2)
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 42) {
        return 0
    } else {
        return -1
    }
}
