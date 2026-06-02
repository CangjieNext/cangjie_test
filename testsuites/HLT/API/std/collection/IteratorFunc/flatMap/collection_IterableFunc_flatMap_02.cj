/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: flatMapLogic.cj
// EXEC: %compiler %cmp_opt %f flatMapLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*

main(): Int64 {
    var arr1: Array<Array<Int32>> = [[8, 9, 10, 25], [18, 19, 120, 125], [28, 29, 220, 225]]
    var arr1Expect = ["8", "9", "10", "25", "18", "19", "120", "125", "28", "29", "220", "225"]
    var arr2 = Array<Array<Int32>>()
    var arr2Expect = Array<String>()
    var cases01 = [
        testIterableFlatMap<Array<Int32>, String>(arr1, arr1Expect, lamdaInt32ToString),
        testIterableFlatMap<Array<Int32>, String>(arr2, arr2Expect, lamdaInt32ToString)
    ]
    var resultExpexct1 = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpexct1) {
        return 1
    }
    var set1 = ArrayList<HashSet<UInt8>>(
        [HashSet<UInt8>([8, 9, 10, 25]), HashSet<UInt8>([80, 90, 12, 27]), HashSet<UInt8>([45, 46, 47, 49])])
    var set1Expect = HashSet<UInt64>([8, 9, 10, 25, 80, 90, 12, 27, 45, 46, 47, 49])
    var set2 = ArrayList<HashSet<UInt8>>()
    var set2Expect = HashSet<UInt64>()
    var cases02 = [
        testIterableFlatMap<HashSet<UInt8>, UInt64>(set1, set1Expect, lamdaUInt8ToUInt64),
        testIterableFlatMap<HashSet<UInt8>, UInt64>(set2, set2Expect, lamdaUInt8ToUInt64)
    ]
    if (cases02 != resultExpexct1) {
        return 2
    }
    return 0
}
