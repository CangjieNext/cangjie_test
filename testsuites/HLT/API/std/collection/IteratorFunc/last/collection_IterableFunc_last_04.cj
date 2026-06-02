/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arrlist1 = ArrayList<Int64>([8, 9, 10, 25, 18, 19, 120, 125])
    var elementFirstBeforeActual1 = last<Int64>(arrlist1)
    if (elementFirstBeforeActual1 != Option<Int64>.Some(125)) {
        return 1
    }
    arrlist1.remove(at: arrlist1.size - 1)
    var elementFirstAfterActual2 = last<Int64>(arrlist1)
    if (elementFirstAfterActual2 != Option<Int64>.Some(120)) {
        return 2
    }
    arrlist1.remove(at: 5)
    var elementFirstAfterActual3 = last<Int64>(arrlist1)
    if (elementFirstAfterActual3 != Option<Int64>.Some(120)) {
        return 3
    }
    return 0
}
