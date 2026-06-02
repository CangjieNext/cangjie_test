// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func test1() {
    var a = (1, 2, 3, 4)
    var b = a
    (a, b)
}

func test2(): Int64 {
    var a = test1()
    var f = a[0][0]
    var tup = (2, f, a[1][1], 7)
    var (first, second, third, fourth) = tup
    var b = if (a[0] == a[1]) {
        1
    } else {
        2
    }
    var c = if (a[0] != (1, 2, 3, 5)) {
        1
    } else {
        2
    }
    return first + tup[2] + b + c
}

func codegenUnitTest(): Int64 {
    return test2()
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 6) {
        return 0
    } else {
        return -1
    }
}
