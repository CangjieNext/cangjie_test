/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../DataCustomType.cj collectHashMapLogic.cj
// EXEC: %compiler %cmp_opt %f DataCustomType.cj collectHashMapLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arr1 = Array<(A, Array<Array<Array<B>>>)>()
    var arr2 = Array<(B, ArrayList<Array<HashSet<C>>>)>()
    var arr3 = Array<(C, ArrayList<ArrayList<Array<HashSet<UInt64>>>>)>()
    var arr4 = Array<(B, Array<ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>>)>()

    var cases01 = [testIterableCollectHashMap<A, Array<Array<Array<B>>>>(arr1),
        testIterableCollectHashMap<B, ArrayList<Array<HashSet<C>>>>(arr2),
        testIterableCollectHashMap<C, ArrayList<ArrayList<Array<HashSet<UInt64>>>>>(arr3),
        testIterableCollectHashMap<B, Array<ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>>>(
        arr4)]

    var resultExpexct = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpexct) {
        return 1
    }
    return 0
}
