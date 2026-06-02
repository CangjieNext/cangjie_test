/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../DataCustomType.cj countLogic.cj
// EXEC: %compiler %cmp_opt %f DataCustomType.cj countLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    let aaa1 = Array<Array<Array<UInt16>>>() //complex 1
    let lah1 = ArrayList<Array<HashSet<UInt64>>>() //complex 2
    let llah1 = ArrayList<ArrayList<Array<HashSet<UInt64>>>>() //complex 3
    let alaalllah1 = Array<ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>>() //complex 4

    var cases01 = [
        testIterableCount<Array<Array<UInt16>>>(aaa1, 0),
        testIterableCount<Array<HashSet<UInt64>>>(lah1, 0),
        testIterableCount<ArrayList<Array<HashSet<UInt64>>>>(llah1, 0),
        testIterableCount<ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>>(alaalllah1,
            0)
    ]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        println(cases01)
        return 1
    }
    return 0
}
