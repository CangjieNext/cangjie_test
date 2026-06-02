/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE:  forEachLogic.cj
// EXEC: %compiler %cmp_opt %f forEachLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

var arr1 = ArrayList<Int32>([8, 9, 10, 25, 18, 19, 120, 125])

main(): Int64 {
    try {
        testIterableForeach<Int32>(arr1, arr1)
    } catch (e: ConcurrentModificationException) {
        return 0
    }
    return 1
}
