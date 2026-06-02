/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %export cjEnableAsyncAllocation=1&& %run %run_opt %output %run_args | compare %f
// ASSERT:scan 53289

import std.collection.*

var kContentOffset: Int64 = 16 // kclass(8) + length(4) align to 8
var kPageSize: Int64 = 4 * 1024

func AllocTest(slotSizeLimit: Int64): Int64 {
    let arrayAll = ArrayList<Array<Int8>>()
    var cnt: Int64 = 0
    var slotSize: Int64 = 1 * 1024 - kContentOffset // start from 1KB
    while (slotSize <= slotSizeLimit - kContentOffset) {
        var count: Int64 = 0
        while (count < (kPageSize * 2560 / (slotSize + kContentOffset) + 5)) { // alloc > 10MB
            var array1: Array<Int8> = Array<Int8>(slotSize, repeat: 2)
            arrayAll.add(array1)
            count++
        }
        cnt = cnt + arrayAll.size
        arrayAll.clear() // set all of current slotSize objs unreachable
        slotSize = slotSize + 512 // step from 256 -> 512, less memory stress for full concurrent copy GC
    }
    return cnt
}

var k10KB: Int64 = 10 * 1024

// Objective: background GC triggered, no OOM and the function returns normally
main(): Int64 {
    print((AllocTest(k10KB)).toString(), flush: true)
    return 0
}
