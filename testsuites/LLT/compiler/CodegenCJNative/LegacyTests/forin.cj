// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func codegenUnitTest(): Int64 {
    var a = 0
    var array: Array<Int64> = [1, 3]
    for (i in [1, 3]) {
        a = a + i
        continue
        a = a * 2
    } // 4

    var b = 0
    for (i in array) {
        if (i > 2) {
            b = b + i * 10
        } // 30
    }
    var c = 0
    var arr: Array<Array<Int64>> = [[10, 20], [30, 40]]
    for (j in arr) {
        for (k in j) {
            c = c + k
        }
    } // 100

    return a + b + c
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 134) {
        return 0
    } else {
        return -1
    }
}
