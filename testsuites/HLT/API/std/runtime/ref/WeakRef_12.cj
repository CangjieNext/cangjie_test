/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: util.cj
// EXEC: %compiler %cmp_opt %f util.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.ref.*
import std.collection.*

// Use global strong refs to make lifetime of referents predictable.
var arr1 = ArrayList<Int64>([0, 1, 2])
var arr2 = ArrayList<Int64>([0, 1, 2, 3, 4])

main() {
    var cache1 = WeakRef<ArrayList<Int64>>(arr1, CleanupPolicy.EAGER)
    var cache2 = WeakRef<ArrayList<Int64>>(arr2, CleanupPolicy.DEFERRED)
    if (!checkAlive<ArrayList<Int64>>(cache1)) {
        return 1
    }
    if (!checkAlive<ArrayList<Int64>>(cache2)) {
        return 2
    }

    cache1.clear()
    cache2.clear()
    if (!checkDeath<ArrayList<Int64>>(cache1)) {
        return 3
    }
    if (!checkDeath<ArrayList<Int64>>(cache2)) {
        return 4
    }

    0
}
