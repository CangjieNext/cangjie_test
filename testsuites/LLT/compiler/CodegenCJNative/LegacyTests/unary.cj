// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func ark_unary(a: Int32): Int32 {
    let c1: Int32 = (-a)
    let c2: Int32 = (a)
    let c4: Int32 = (!a)
    let c5: Int32 = c1 + c2 + c4
    return c5
}

func codegenUnitTest(): Int32 {
    return ark_unary(3)
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == -4) {
        return 0
    } else {
        return -1
    }
}
