/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:  isEmptyLogic.cj
// EXEC: %compiler %cmp_opt %f isEmptyLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arr1 = Array<Bool>()
    var arrlist1 = ArrayList<String>()
    var set1 = HashSet<Int8>()
    var map1 = HashMap<UInt8, UInt64>()

    var cases01 = [testIterableIsEmpty<Bool>(arr1, true), testIterableIsEmpty<String>(arrlist1, true),
        testIterableIsEmpty<Int8>(set1, true), testIterableIsEmpty<(UInt8, UInt64)>(map1, true)]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (cases01 != resultExpect) {
        return 1
    }
    return 0
}
