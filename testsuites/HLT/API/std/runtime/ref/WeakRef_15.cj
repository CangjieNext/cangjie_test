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
var arr = ArrayList<Int64>([0, 1, 2])

main() {
    var cache = WeakRef<ArrayList<Int64>>(arr, CleanupPolicy.DEFERRED)
    if (!checkAlive<ArrayList<Int64>>(cache)) {
        return 1
    }

    cache.clear()
    if (!checkDeath<ArrayList<Int64>>(cache)) {
        return 2
    }

    cache = WeakRef<ArrayList<Int64>>(arr, CleanupPolicy.EAGER)
    if (!checkAlive<ArrayList<Int64>>(cache)) {
        return 3
    }

    cache.clear()
    if (!checkDeath<ArrayList<Int64>>(cache)) {
        return 4
    }

    0
}
