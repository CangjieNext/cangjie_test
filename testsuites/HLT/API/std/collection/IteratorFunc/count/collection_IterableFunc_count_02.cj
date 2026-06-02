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
    var arr1: Array<Int32> = [8, 9, 10, 25, 18, 19, 120, 125]
    var arrlist1 = ArrayList<String>(["8", "9", "10", "25", "18", "19", "120", "125"])
    var set1 = HashSet<Int8>([8, 9, 10, 25, 18, 19, 120, 125])
    var map1 = HashMap<Int8, Int64>([(1, 2), (3, 4), (5, 6)])

    var cases01 = [
        testIterableCount<Int32>(arr1, arr1.size),
        testIterableCount<String>(arrlist1, arrlist1.size),
        testIterableCount<Int8>(set1, set1.size),
        testIterableCount<(Int8, Int64)>(map1, map1.size)
    ]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        println(cases01)
        return 1
    }
    return 0
}
