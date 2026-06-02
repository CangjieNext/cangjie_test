// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func add1() {
    if (false) {
        return {a: Int32, b: Int32 => return a - b}
    } else {
        return {a: Int32, b: Int32 => return a + b}
    }
}

func add() {
    return add1()
}

func codegenUnitTest(): Int32 {
    var sum = add()
    return sum(10, 20) + 30
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 60) {
        return 0
    } else {
        return -1
    }
}
