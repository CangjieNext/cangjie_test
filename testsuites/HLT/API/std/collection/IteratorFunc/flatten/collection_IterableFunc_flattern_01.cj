/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: flattenLogic.cj
// EXEC: %compiler %cmp_opt %f flattenLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*

main(): Int64 {
    var arr1: Array<Array<Int64>> = [[8, 9, 10, 25], [18, 19, 120, 125], [28, 29, 220, 225]]
    var arr1Expect = [8, 9, 10, 25, 18, 19, 120, 125, 28, 29, 220, 225]

    var arr2: Array<Array<Float64>> = [Array<Float64>(), Array<Float64>(), Array<Float64>(), Array<Float64>()]
    var arr2Expect = Array<Float64>()

    var set1 = ArrayList<HashSet<Int32>>(
        [HashSet<Int32>([8, 9, 10, 25]), HashSet<Int32>([80, 90, 12, 27]), HashSet<Int32>([45, 46, 47, 49])])
    var set1Expect = HashSet<Int32>([8, 9, 10, 25, 80, 90, 12, 27, 45, 46, 47, 49])

    var set2 = ArrayList<HashSet<Int8>>()
    var set2Expect = HashSet<Int8>()

    var arraylist1 = ArrayList<ArrayList<Rune>>(
        [ArrayList<Rune>([r'd', r'b', r'a', r'd', r'a', r'h', r'j', r'd', r'g', r'a']),
            ArrayList<Rune>([r'4', r'2', r'4', r'2', r'4', r'2', r'4', r'中']),
            ArrayList<Rune>([r'j', r'h', r'g', r'd', r'h', r'j', r'a', r'd'])])
    var arraylist1Expect = ArrayList<Rune>(
        [r'd', r'b', r'a', r'd', r'a', r'h', r'j', r'd', r'g', r'a', r'4', r'2', r'4', r'2', r'4', r'2', r'4', r'中',
            r'j', r'h', r'g', r'd', r'h', r'j', r'a', r'd'])

    var arraylist2 = ArrayList<ArrayList<UInt32>>()
    var arraylist2Expect = ArrayList<UInt32>()

    var cases01 = [
        testIterableFlattern<Array<Int64>, Int64>(arr1, arr1Expect),
        testIterableFlattern<Array<Float64>, Float64>(arr2, arr2Expect),
        testIterableFlattern<HashSet<Int32>, Int32>(set1, set1Expect),
        testIterableFlattern<HashSet<Int8>, Int8>(set2, set2Expect),
        testIterableFlattern<ArrayList<Rune>, Rune>(arraylist1, arraylist1Expect),
        testIterableFlattern<ArrayList<UInt32>, UInt32>(arraylist2, arraylist2Expect)
    ]
    var resultExpexct1 = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpexct1) {
        return 3
    }
    return 0
}
