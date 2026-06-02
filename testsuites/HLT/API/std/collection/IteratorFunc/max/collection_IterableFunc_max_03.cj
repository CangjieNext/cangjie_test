/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: maxLogic.cj
// EXEC: %compiler %cmp_opt %f  maxLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arr1 = Array<UInt8>()
    var arrlist1 = ArrayList<String>()
    var set1 = HashSet<Int8>()

    var cases01 = [testIterableMax<UInt8>(arr1, Option<UInt8>.None),
        testIterableMax<String>(arrlist1, Option<String>.None), testIterableMax<Int8>(set1, Option<Int8>.None)]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (resultExpect != cases01) {
        return 1
    }
    return 0
}
