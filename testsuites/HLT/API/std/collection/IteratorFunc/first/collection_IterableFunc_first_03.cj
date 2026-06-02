/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: firstLogic.cj
// EXEC: %compiler %cmp_opt %f firstLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*
import std.math.*

main(): Int64 {
    var arrlist1 = ArrayList<Int64>([1])
    var elementFirstBeforeActual = first<Int64>(arrlist1)
    if (elementFirstBeforeActual != Option<Int64>.Some(1)) {
        return 1
    }
    arrlist1.remove(at: 0)
    var elementFirstAfterActual = first<Int64>(arrlist1)
    if (elementFirstAfterActual != Option<Int64>.None) {
        return 2
    }
    return 0
}
