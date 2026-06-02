// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
/* SCAN
1
1
*/

import std.runtime.*

class test {
    var value: Int64 = 1;
}

struct stackVal {
    var x1 = test()
    var x2 = test()
    var x3 = test()
    var x4 = test()
    var x5 = test()
    var x6 = test()
    var x7 = test()
    var x8 = test()
    var x9 = test()
    var x10 = test()
    var x11 = test()
    var x12 = test()
    var x13 = test()
    var x14 = test()
    var x15 = test()
    var x16 = test()
    var x17 = test()
    var x18 = test()
    var x19 = test()
    var x20 = test()
    var x21 = test()
    var x22 = test()
    var x23 = test()
    var x24 = test()
    var x25 = test()
    var x26 = test()
    var x27 = test()
    var x28 = test()
    var x29 = test()
    var x30 = test()
    var x31 = test()
    var a1 = 10
    var a2 = 10
    var a3 = 10
    var a4 = 10
    var a5 = 10
    var a6 = 10
    var a7 = 10
    var a8 = 10
    var a9 = 10
    var a10 = 10
    var a11 = 10
    var a12 = 10
    var a13 = 10
    var a14 = 10
    var a15 = 10
    var a16 = 10
    var a17 = 10
    var a18 = 10
    var a19 = 10
    var a20 = 10
    var a21 = 10
    var a22 = 10
    var a23 = 10
    var a24 = 10
    var a25 = 10
    var a26 = 10
    var a27 = 10
    var a28 = 10
    var a29 = 10
    var a30 = 10
    var a31 = 10
    var y1 = test()
    var y2 = test()
    var y3 = test()
    var y4 = test()
    var y5 = test()
    var y6 = test()
    var y7 = test()
    var y8 = test()
    var y9 = test()
    var y10 = test()
    var y11 = test()
    var y12 = test()
    var y13 = test()
    var y14 = test()
    var y15 = test()
    var y16 = test()
    var y17 = test()
    var y18 = test()
    var y19 = test()
    var y20 = test()
    var y21 = test()
    var y22 = test()
    var y23 = test()
    var y24 = test()
    var y25 = test()
    var y26 = test()
    var y27 = test()
    var y28 = test()
    var y29 = test()
    var y30 = test()
    var y31 = test()
}

struct stackVal2 {
    var x1 = test()
    var x2 = test()
    var x3 = test()
    var x4 = test()
    var x5 = test()
    var x6 = test()
    var x7 = test()
    var x8 = test()
    var x9 = test()
    var x10 = test()
    var x11 = test()
    var x12 = test()
    var a1 = 10
    var a2 = 10
    var a3 = 10
    var a4 = 10
    var a5 = 10
    var a6 = 10
    var a7 = 10
    var a8 = 10
    var a9 = 10
    var a10 = 10
    var a11 = 10
    var a12 = 10
    var y1 = test()
    var y2 = test()
    var y3 = test()
    var y4 = test()
    var y5 = test()
    var y6 = test()
    var y7 = test()
    var y8 = test()
    var y9 = test()
    var y10 = test()
    var y11 = test()
    var y12 = test()
}

func PrintStackVal(x: stackVal) {
    println(x.x1.value)
}

func PrintStackVal2(x: stackVal2) {
    println(x.x1.value)
}

main(): Int64 {
    var val = stackVal()
    var val2 = stackVal2()
    for (i in 0..10000000) {
        var t = test()
    }
    PrintStackVal(val)
    for (i in 0..10000000) {
        var t = test()
    }
    PrintStackVal2(val2)
    return 0
}
