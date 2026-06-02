// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

func test0(): Int16 {
    var a: Array<Int16> = Array<Int16>(10000) {i => Int16(2 * i)}
    var b: Array<Int16> = Array<Int16>(10000) {i => Int16(3 * i)}
    var c: Array<Int16> = Array<Int16>(10000) {i => Int16(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int16> = Array<Int16>(outterLoopCnt) {i => Int16(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size : 2) {
            a[i] = b[i] + c[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int16(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    if (sum[9] != -16014 || sum[8] != -26014 || sum[7] != 29522 || sum[6] != 19522 || sum[5] != 9522 || sum[4] != -478 ||
        sum[3] != -10478 || sum[2] != -20478 || sum[1] != -30478 || sum[0] != 25058) {
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
