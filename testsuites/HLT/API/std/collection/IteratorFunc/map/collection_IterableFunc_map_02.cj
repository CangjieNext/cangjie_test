/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*

main(): Int64 {
    var arr1: Array<(Int8, Int16)> = [(8, 9), (10, 25)]
    var mapFunc1 = map<(Int8, Int16), (UInt8, UInt64)>({a: (Int8, Int16) => return (UInt8(a[0]), UInt64(a[1]))})
    var mapFunc2 = map<(Int8, Int16), (Int8, Int16)>({a: (Int8, Int16) => return (Int8(a[0]), Int16(a[1]))})
    var mapResult1 = mapFunc1(arr1)
    var mapResult2 = mapFunc2(arr1)
    var mapiterator1 = mapResult1.iterator()
    var mapiterator2 = mapResult2.iterator()
    var (m1, n1) = mapiterator1.next().getOrThrow()
    var (m2, n2) = mapiterator1.next().getOrThrow()
    var (m3, n3) = mapiterator2.next().getOrThrow()
    var (m4, n4) = mapiterator2.next().getOrThrow()
    if (!(m1 is UInt8) || !(m2 is UInt8)) {
        return 1
    }
    if (!(n1 is UInt64) || !(n2 is UInt64)) {
        return 2
    }
    if (m1 != 8 || m2 != 10) {
        return 3
    }
    if (n1 != 9 || n2 != 25) {
        return 4
    }
    if (!(m3 is Int8) || !(m4 is Int8)) {
        return 1
    }
    if (!(n3 is Int16) || !(n4 is Int16)) {
        return 2
    }
    if (m3 != 8 || m4 != 10) {
        return 3
    }
    if (n3 != 9 || n4 != 25) {
        return 4
    }
    return 0
}
