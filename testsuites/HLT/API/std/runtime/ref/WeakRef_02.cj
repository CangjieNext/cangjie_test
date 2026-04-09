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
var a: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2])
var m: HashMap<String, Int64> = HashMap<String, Int64>([("d", 11), ("e", 12)])

main() {
    var cache1 = WeakRef<ArrayList<Int64>>(a, CleanupPolicy.EAGER)
    if (!checkAlive<ArrayList<Int64>>(cache1)) {
        return 1
    }

    var cache2 = WeakRef<HashMap<String, Int64>>(m, CleanupPolicy.DEFERRED)
    if (!checkAlive<HashMap<String, Int64>>(cache2)) {
        return 2
    }

    0
}
