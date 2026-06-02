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
    var arr1: Array<UInt32> = [8, 9, 10, 125, 18, 125, 120, 125]
    var arrlist1 = ArrayList<UInt16>([8, 125, 10, 25, 125, 19, 120, 125])
    var set1 = HashSet<Int32>([8, 9, 125, 25, 125, 125, 120, 125])
    var cases01 = [testIterableMax<UInt32>(arr1, Option<UInt32>.Some(125)),
        testIterableMax<UInt16>(arrlist1, Option<UInt16>.Some(125)),
        testIterableMax<Int32>(set1, Option<Int32>.Some(125))]
    var resultExpect = Array<Int64>(cases01.size, repeat: 0)
    if (resultExpect != cases01) {
        return 1
    }
    return 0
}
