/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: collectHashMapLogic.cj
// EXEC: %compiler %cmp_opt %f collectHashMapLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
import std.collection.*
import std.math.*

main(): Int64 {
    var arr1: Array<(Int32, Int64)> = [(8, 9), (10, 25), (18, 19), (120, 125)]
    var arr2 = Array<(UInt32, UInt64)>()
    var arr3: Array<(Int8, Int16)> = [(8, 9), (10, 25), (18, 19), (120, 125)]
    var arr4: Array<(UInt8, UInt16)> = [(8, 9), (10, 25), (18, 19), (120, 125)]
    var arrlist1 = ArrayList<(Float32, Float64)>(
        [(Float32(8), Float64(9)), (Float32(10), Float64(25)), (Float32(18), Float64(19)), (Float32(120), Float64(125))])
    var arrlist2 = ArrayList<(Float16, String)>(
        [(Float16(8), "9"), (Float16(10), "25"), (Float16(18), "19"), (Float16(120), "125")])
    var arrlist3 = ArrayList<(Rune, Bool)>([(r'a', true), (r'0', false), (r'd', true), (r'2', true)])
    var arrlist4 = ArrayList<(Float16, Int64)>()

    var cases01 = [testIterableCollectHashMap<Int32, Int64>(arr1), testIterableCollectHashMap<UInt32, UInt64>(arr2),
        testIterableCollectHashMap<Int8, Int16>(arr3), testIterableCollectHashMap<UInt8, UInt16>(arr4),
        testIterableCollectHashMap<Float32, Float64>(arrlist1), testIterableCollectHashMap<Float16, String>(arrlist2),
        testIterableCollectHashMap<Rune, Bool>(arrlist3), testIterableCollectHashMap<Float16, Int64>(arrlist4)]
    var resultExpexct = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpexct) {
        return 1
    }
    return 0
}
