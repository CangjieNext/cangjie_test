// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

var d: Int32 = 1

func f(): Int32 {
    10
}

func codegenUnitTest(): Int32 {
    var arr: Array<Int32> = [67, 71, 73]
    var arr2: Array<Array<Int32>> = [[11, 22, 33], [44, 55, 66]]
    var c: Int32 = 0
    arr[2] = 2000
    arr2[1] = [0, 0, 0]
    c = arr[2] + 1000 + arr2[1][2]
    var d = d
    var f = f()
    if (false) {
        var codegenUnitTest = codegenUnitTest()
    }
    return c + d + f
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 3011) {
        return 0
    } else {
        return -1
    }
}
