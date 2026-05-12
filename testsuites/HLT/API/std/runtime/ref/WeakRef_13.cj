/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.ref.*
import std.collection.*

// Use global strong refs to make lifetime of referents predictable.
var arr = ArrayList<Int64>([-1])

main() {
    for (i in 0..10000) {
        arr = ArrayList<Int64>([i])
        var cache = WeakRef<ArrayList<Int64>>(arr, CleanupPolicy.DEFERRED)
        match (cache.value) {
            case Some(x) => x.add(i + 1)
            case None => arr.add(0)
        }
    }
    return 0
}
