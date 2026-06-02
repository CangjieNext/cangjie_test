// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

func test0(): UInt8 {
    var a: Array<UInt8> = Array<UInt8>(10000) {i => UInt8(2 * i)}
    var b: Array<UInt8> = Array<UInt8>(10000) {i => UInt8(3 * i)}
    var c: Array<UInt8> = Array<UInt8>(10000) {i => UInt8(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<UInt8> = Array<UInt8>(outterLoopCnt) {i => UInt8(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + UInt8(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    if (sum[9] != 254 || sum[8] != 238 || sum[7] != 222 || sum[6] != 206 || sum[5] != 190 || sum[4] != 174 || sum[3] !=
        158 || sum[2] != 142 || sum[1] != 126 || sum[0] != 110) {
        return 1
    }
    return 0
}

main() {
    var result0 = test0()
    if (result0 != 0) {
        return 1
    }
    return 0
}
