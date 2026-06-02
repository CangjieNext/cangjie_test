/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: foldLogic.cj
// EXEC: %compiler %cmp_opt %f foldLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*

main(): Int64 {
    var arr1 = Array<Float32>()
    var set1 = HashSet<Int8>()
    var arraylist1 = ArrayList<UInt32>()
    var cases01 = [testIterableFold<Float32, Float64>(Float64(2),
        {
            item: Float64, r: Float32 => if (item == Float64(8)) {
                return Float64(item)
            } else {
                return Float64(r) + item
            }
        }, arr1, Float64(2)),
        testIterableFold<Int8, Int32>(-199,
        {
            item: Int32, r: Int8 => if (item == 2) {
                return Int32(item)
            } else {
                return Int32(r) + item
            }
        }, set1, Int32(-199)),
        testIterableFold<UInt32, UInt64>(123,
        {
            item: UInt64, r: UInt32 => if (item == 26) {
                return UInt64(item)
            } else {
                return UInt64(r) + item
            }
        }, arraylist1, UInt64(123))]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        return 1
    }
    return 0
}
