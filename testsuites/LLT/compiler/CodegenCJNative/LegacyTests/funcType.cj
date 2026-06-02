// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func a(x: Bool) {
    return 0
}

func a(x: Int32, y: Int32): Int32 {
    return x + y
}

func funcType(x: Int32, y: Int32) {
    var b: (Int32, Int32) -> Int32 = a
    return b(x, y)
}

func codegenUnitTest(): Int32 {
    return funcType(10, 20)
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 30) {
        return 0
    } else {
        return -1
    }
}
