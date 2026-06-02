/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 16951234978816701620556505

import std.collection.*

var kContentOffset: Int64 = 16 // kclass(8) + length(4) align to 8
var kPageSize: Int64 = 4 * 1024

func AllocTest(slotSizeLimit: Int64): Int64 {
    var slotSize: Int64 = slotSizeLimit - kContentOffset - 7
    let arrayAll = ArrayList<Array<Int8>>()
    while (slotSize <= slotSizeLimit - kContentOffset) {
        var count: Int64 = 0
        while (count < (kPageSize / (slotSize + kContentOffset) + 10)) { // alloc > 4KB
            var array1: Array<Int8> = Array<Int8>(slotSize, {slotSize => 2})
            arrayAll.add(array1)
            count++
        }
        slotSize++
    }
    return arrayAll.size
}

var kMAX3X8B: Int64 = 3 * 8
var kMAX4X8B: Int64 = 4 * 8
var kMAX5X8B: Int64 = 5 * 8
var kMAX6X8B: Int64 = 6 * 8
var kMAX7X8B: Int64 = 7 * 8
var kMAX8X8B: Int64 = 8 * 8
var kMAX9X8B: Int64 = 9 * 8
var kMAX10X8B: Int64 = 10 * 8

// Maybe we need alloc more bytes to test GC
main(): Int64 {
    print((AllocTest(kMAX3X8B)).toString())
    print((AllocTest(kMAX4X8B)).toString())
    print((AllocTest(kMAX5X8B)).toString())
    print((AllocTest(kMAX6X8B)).toString())
    print((AllocTest(kMAX7X8B)).toString())
    print((AllocTest(kMAX8X8B)).toString())
    print((AllocTest(kMAX9X8B)).toString())
    print((AllocTest(kMAX10X8B)).toString())
    return 0
}
