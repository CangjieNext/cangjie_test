/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 
// DEPENDENCE: util.cj
// (not CJNATIVE) EXEC: %compiler %cmp_opt %f util.cj -o %output
// (not CJNATIVE) RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.ref.*
import std.reflect.*
import std.runtime.*

// Use global strong refs to make lifetime of referents predictable.
var a = Date()

main() {
    var cache = WeakRef<Date>(a, CleanupPolicy.EAGER)

    if (!checkAlive(cache)) {
        return 1
    }

    // Destroy reference to the weak ref referent.
    a = Date()

    // Theoretically GC() here would reclaim the weak ref referent,
    // But please note GC() is not guaranteed to execute, so we need
    // a spin lock to sense the referent is actually reclaimed due
    // to finalizer.
    // There are also rare chances GC() is not triggered, then TIMEOUT
    // machanism of test framework is here to rescue, and runtime needs
    // to investigate why finalizer is not executed in time.
    GC(heavy: false) // minor gc, only triggers EAGER policy
    while (spin.load()) {}

    if (!checkDeath(cache)) {
        return 2
    }
    return 0
}
