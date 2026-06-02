// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

func test0(): UInt16 {
    var a: Array<UInt16> = Array<UInt16>(10000) {i => UInt16(2 * i)}
    var b: Array<UInt16> = Array<UInt16>(10000) {i => UInt16(3 * i)}
    var c: Array<UInt16> = Array<UInt16>(10000) {i => UInt16(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<UInt16> = Array<UInt16>(outterLoopCnt) {i => UInt16(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + UInt16(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    if (sum[9] != 15496 || sum[8] != 5496 || sum[7] != 61032 || sum[6] != 51032 || sum[5] != 41032 || sum[4] != 31032 ||
        sum[3] != 21032 || sum[2] != 11032 || sum[1] != 1032 || sum[0] != 56568) {
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
