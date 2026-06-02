// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

var gRange1 = 1..10 : 3

func codegenUnitTest(): Int64 {
    var a = 0
    let range1 = 0..10 : 2
    for (i in range1) {
        a = a + 1
    } // 5

    var b = 0
    let range2 = 0..10
    for (i in range2) {
        b = b + i * 10
    } // 450

    var c = 0
    for (i in 10..-10 : -3) {
        for (j in -10..10 : 4) {
            c = c + i + j
        }
    } // -35

    var d = 0
    for (i in 10..-10 : -2) {
        if (i > 2) {
            d = d + i
        } // 28
    }

    var e = 0
    for (i in gRange1) {
        e = e + i
    } // 12

    var f = 0
    for (i in UInt8(0)..130 : 10) {
        f = f + Int64(i) / 10
    } // 78

    return a + b + c + d + e + f // 538
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 538) {
        return 0
    } else {
        return -1
    }
}
