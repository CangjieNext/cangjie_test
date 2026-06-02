// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func generateModule(a: Int32, b: Int32): Int32 {
    let c: Int32 = a + b
    let d: Float32 = -2.0
    return (a + b * 10) * 100 + c
}

func codegenUnitTest(): Int32 {
    return generateModule(40, 2)
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 6042) {
        return 0
    } else {
        return -1
    }
}
