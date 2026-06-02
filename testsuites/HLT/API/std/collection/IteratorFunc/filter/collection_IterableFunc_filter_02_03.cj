/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: filterLogic.cj
// EXEC: %compiler %cmp_opt %f filterLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*

main(): Int64 {
    let aaa1 = Array<Array<Array<UInt16>>>()
    let lah1 = ArrayList<Array<HashSet<UInt64>>>()
    let llah1 = ArrayList<ArrayList<Array<HashSet<UInt64>>>>()
    let alaalllah1 = Array<ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>>()
    let cases01 = [
        testIterableFilter<Array<Array<UInt16>>>(aaa1, {a: Array<Array<UInt16>> => false}),
        testIterableFilter<Array<HashSet<UInt64>>>(lah1, {a: Array<HashSet<UInt64>> => false}),
        testIterableFilter<ArrayList<Array<HashSet<UInt64>>>>(llah1, {a: ArrayList<Array<HashSet<UInt64>>> => false}),
        testIterableFilter<ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>>(alaalllah1,
            {a: ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>> => false})
    ]
    var resultExpexct1 = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpexct1) {
        return 1
    }
    return 0
}
