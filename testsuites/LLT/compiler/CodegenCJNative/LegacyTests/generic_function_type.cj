// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func f<T>(a: T): T {
    return a
}

func codegenUnitTest(): Int32 {
    var a = f<Int32>
    var ans0 = f<(Int32) -> Int32>(f<Int32>)(1) // 1
    var ans1 = a(10) // 10
    var ans2 = f<(Int32) -> Int32>(a)(100) // 100
    return ans0 + ans1 + ans2
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 111) {
        return 0
    } else {
        return -1
    }
}
