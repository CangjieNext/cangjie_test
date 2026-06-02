// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

func test0(): Int32 {
    var a: Array<Int32> = Array<Int32>(5000) {i => Int32(2 * i)}
    var b: Array<Int32> = Array<Int32>(5000) {i => Int32(3 * i)}
    var c: Array<Int32> = Array<Int32>(5000) {i => Int32(i % 3)}
    var d: Array<Int32> = Array<Int32>(5000) {i => Int32(i % 4)}
    var e: Array<Int32> = Array<Int32>(5000) {i => Int32(2 * i % 3)}
    var outterLoopCnt = 10
    var sum: Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--

        for (i in 2..a.size) {
            a[i] = b[i] + c[i]
            c[i] = a[i - 2] - d[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + e[i] / 3 + Int32(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    if (sum[9] != 7542499 || sum[8] != 15028501 || sum[7] != 22508508 || sum[6] != 29982524 || sum[5] != 37450046 ||
        sum[4] != 44912580 || sum[3] != 52368630 || sum[2] != 59818697 || sum[1] != 67262782 || sum[0] != 74700807) {
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
