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
    var arr1: Array<Int32> = [8, 9, 10, 25, 18, 19, 120, 125]
    var arr2 = Array<Bool>()
    var set1 = HashSet<Rune>([r'8', r'9', r'0', r'a', r'v', r'f', r'd', r'k'])
    var set2 = HashSet<UInt64>()
    var arrlist1 = ArrayList<String>(["8", "9", "10", "25", "18", "19", "120", "125"])
    var arrlist2 = ArrayList<UInt16>()

    var cases01 = [testIterableContains<Int32>(arr1, 19, true), testIterableContains<Int32>(arr1, 199, false),
        testIterableContains<Bool>(arr2, true, false), testIterableContains<Bool>(arr2, false, false),
        testIterableContains<Rune>(set1, r'v', true), testIterableContains<Rune>(set1, r't', false),
        testIterableContains<UInt64>(set2, 19, false), testIterableContains<String>(arrlist1, "25", true),
        testIterableContains<String>(arrlist1, "1000", false), testIterableContains<UInt16>(arrlist2, 1, false)]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        println(cases01)
        return 1
    }
    return 0
}
