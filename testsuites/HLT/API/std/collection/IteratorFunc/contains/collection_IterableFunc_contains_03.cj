/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../DataCustomType.cj containsLogic.cj
// EXEC: %compiler %cmp_opt %f DataCustomType.cj containsLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    let a1: Array<UInt16> = [1, 2]
    let aa1: Array<Array<UInt16>> = [a1, a1]
    let aa2: Array<Array<UInt16>> = [a1]
    let aa3: Array<Array<UInt16>> = [a1, a1, a1]
    let aaa1: Array<Array<Array<UInt16>>> = [aa1, aa2] //complex 1
    let h1 = HashSet<UInt64>([3, 4])
    let h2 = HashSet<UInt64>([3, 5])
    let ah1: Array<HashSet<UInt64>> = [h1, h1]
    let ah2: Array<HashSet<UInt64>> = [h1, h2]
    let ah3: Array<HashSet<UInt64>> = [h1, h2, h1, h2]
    let lah1 = ArrayList<Array<HashSet<UInt64>>>([ah1, ah2]) //complex 2
    let lah2 = ArrayList<Array<HashSet<UInt64>>>([ah2])
    let lah3 = ArrayList<Array<HashSet<UInt64>>>([ah2, ah1, ah1, ah2])
    let llah1 = ArrayList<ArrayList<Array<HashSet<UInt64>>>>([lah1, lah2]) //complex 3
    let llah2 = ArrayList<ArrayList<Array<HashSet<UInt64>>>>([lah2])
    let lllah1 = ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>([llah1, llah2])
    let lllah2 = ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>([llah2])
    let alllah1: Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>> = [lllah1, lllah2]
    let alllah2: Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>> = [lllah2]
    let aalllah1: Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>> = [alllah1, alllah2]
    let aalllah2: Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>> = [alllah1]
    let laalllah1 = ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>(
        [aalllah1, aalllah2])
    let laalllah2 = ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>([aalllah2])
    let laalllah3 = ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>(
        [aalllah1, aalllah2, aalllah2, aalllah2])
    let alaalllah1: Array<ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>> = [laalllah1,
        laalllah2] //complex 4

    var cases01 = [
        testIterableContains<Array<Array<UInt16>>>(aaa1, aa1, true),
        testIterableContains<Array<Array<UInt16>>>(aaa1, aa3, false),
        testIterableContains<Array<HashSet<UInt64>>>(lah1, ah2, true),
        testIterableContains<Array<HashSet<UInt64>>>(lah1, ah3, false),
        testIterableContains<ArrayList<Array<HashSet<UInt64>>>>(llah1, lah2, true),
        testIterableContains<ArrayList<Array<HashSet<UInt64>>>>(llah1, lah3, false),
        testIterableContains<ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>>(
            alaalllah1, laalllah2, true),
        testIterableContains<ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>>(
            alaalllah1, laalllah3, false)
    ]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        println(cases01)
        return 1
    }
    return 0
}
