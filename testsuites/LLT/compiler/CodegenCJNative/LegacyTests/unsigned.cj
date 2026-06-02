// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func ark_unsigned(a: UInt32, b: UInt32): UInt32 {
    let c: UInt32 = a + b
    return (a + b * 10) * 100 + c
}

func codegenUnitTest(): UInt32 {
    ark_unsigned(40, 2)
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 6042) {
        return 0
    } else {
        return -1
    }
}
