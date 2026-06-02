// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*
import std.math.*
import std.convert.*
import std.convert.*

var n = 0

func test0(): Int32 {
    var a: Array<Int32> = Array<Int32>(n) {i => Int32(2 * i)}

    var outterLoopCnt = 10
    var sum: Array<Int32> = Array<Int32>(outterLoopCnt) {i => Int32(0)}
    while (outterLoopCnt > 0) {
        outterLoopCnt--
        for (i in 0..a.size) {
            a[i] = !a[i]
        }

        for (i in 0..a.size) {
            sum[Int64(outterLoopCnt)] += a[i] / 5 + Int32(outterLoopCnt)
        }
        println(sum[Int64(outterLoopCnt)])
    }
    if (n == 10000 && (sum[9] != -19906000 || sum[8] != 20074000 || sum[7] != -19926000 || sum[6] != 20054000 ||
        sum[5] != -19946000 || sum[4] != 20034000 || sum[3] != -19966000 || sum[2] != 20014000 || sum[1] != -19986000 ||
        sum[0] != 19994000)) {
        return 1
    }
    return 0
}

main(args: Array<String>) {
    if (args.size > 0) {
        n = Int64.tryParse(args[args.size - 1]) ?? Int64(10000)
    } else {
        n = 10000
    }

    var result0 = test0()
    if (result0 != 0) {
        return 1
    }
    return 0
}
