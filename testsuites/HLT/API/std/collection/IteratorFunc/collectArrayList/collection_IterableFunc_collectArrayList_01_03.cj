/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../DataCustomType.cj collectArrayListLogic.cj
// EXEC: %compiler %cmp_opt %f DataCustomType.cj collectArrayListLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
import std.collection.*
import std.math.*

main(): Int64 {
    var arr1 = Array<Array<Array<Array<B>>>>()
    var arr2 = Array<ArrayList<Array<HashSet<C>>>>()
    var arr3 = Array<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>()
    var arr4 = Array<Array<ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>>>()

    var casesresult = [testIterableCollectArrayList<Array<Array<Array<B>>>>(arr1),
        testIterableCollectArrayList<ArrayList<Array<HashSet<C>>>>(arr2),
        testIterableCollectArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>(arr3),
        testIterableCollectArrayList<Array<ArrayList<Array<Array<ArrayList<ArrayList<ArrayList<Array<HashSet<UInt64>>>>>>>>>>(
        arr4)]
    var resultExpexct = Array<Int64>(casesresult.size, repeat: 0)
    if (casesresult != resultExpexct) {
        return 1
    }
    return 0
}
