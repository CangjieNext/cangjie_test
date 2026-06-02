// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func codegenUnitTest(): Int32 {
    let n: Int32 = 4
    var x: Int32 = 0
    while (true) {
        x++
        if (x >= n) {
            break
        }
    }
    do {
        x = x * 2
        continue
    } while (x < n * n)
    return x
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 16) {
        return 0
    } else {
        return -1
    }
}
