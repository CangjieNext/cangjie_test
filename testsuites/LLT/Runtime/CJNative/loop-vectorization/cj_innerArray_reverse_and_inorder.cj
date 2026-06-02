// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

func test0(): Int32 {
    var a: Array<Int32> = Array<Int32>(10000) {i => Int32(2 * i)}
    var b: Array<Int32> = Array<Int32>(10000) {i => Int32(3 * i)}
    var c: Array<Int32> = Array<Int32>(10000) {i => Int32(2 * i + 3)}
    var outterLoopCnt = 10
    var sum: Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--

        for (i in (a.size - 1)..=0 : -1) {
            a[i] += b[i] + c[a.size - 1 - i]
        }
        for (i in (a.size - 1)..=0 : -1) {
            a[i] += b[a.size - 1 - i] + c[a.size - 1 - i]
        }
        for (i in (a.size - 1)..=0 : -1) {
            a[a.size - 1 - i] += b[i] + c[a.size - 1 - i]
        }
        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    if (sum[9] != 170087000 || sum[8] != 320080000 || sum[7] != 470073000 || sum[6] != 620066000 || sum[5] != 770059000 ||
        sum[4] != 920052000 || sum[3] != 1070045000 || sum[2] != 1220038000 || sum[1] != 1370031000 || sum[0] !=
        1520024000) {
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
