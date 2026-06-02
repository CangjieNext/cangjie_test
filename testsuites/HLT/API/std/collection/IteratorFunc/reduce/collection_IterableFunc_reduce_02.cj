/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: reduceLogic.cj
// EXEC: %compiler %cmp_opt %f reduceLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*

main(): Int64 {
    var arr1: Array<Float64> = [8.0]
    var set1 = HashSet<Int32>([-199])
    var arraylist1 = ArrayList<UInt64>([123])
    var cases01 = [
        testIterableReduce<Float64>(
            {
                item: Float64, r: Float64 => if (item == Float64(8)) {
                    return Float64(item)
                } else {
                    return Float64(item) + r
                }
            }, arr1, Float64(8)),
        testIterableReduce<Int32>(
            {
                item: Int32, r: Int32 => if (item == 2) {
                    return Int32(item)
                } else {
                    return Int32(item) + r
                }
            }, set1, -199),
        testIterableReduce<UInt64>(
            {
                item: UInt64, r: UInt64 => if (item == 26) {
                    return UInt64(item)
                } else {
                    return UInt64(item) + r
                }
            }, arraylist1, 123)
    ]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        return 1
    }
    return 0
}
