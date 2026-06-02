// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func add(f: (Int32, Int32) -> Int32, a: Int32, b: Int32) {
    return f(a, b)
}

func codegenUnitTest(): Int32 {
    var fun = {a: Int32, b: Int32 => return a + b}
    var sum = 2 * add(fun, 10, 20)
    return sum
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 60) {
        return 0
    } else {
        return -1
    }
}
