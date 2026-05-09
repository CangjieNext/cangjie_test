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

// Use global strong refs to make lifetime of referents predictable.
var a = Date()
var b = Date()

main() {
    var d_cache = WeakRef<Date>(a, CleanupPolicy.DEFERRED)
    var e_cache = WeakRef<Date>(b, CleanupPolicy.EAGER)
    if ((e_cache.cleanupPolicy == CleanupPolicy.EAGER) && (d_cache.cleanupPolicy == CleanupPolicy.DEFERRED) &&
        !(e_cache.cleanupPolicy == CleanupPolicy.DEFERRED) && !(d_cache.cleanupPolicy == CleanupPolicy.EAGER)) {
        return 0
    } else {
        return 1
    }
}
