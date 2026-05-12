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
var d = Date()
var e = Date()

main() {
    var cache1 = WeakRef<Date>(d, CleanupPolicy.EAGER)
    var cache2 = WeakRef<Date>(d, CleanupPolicy.DEFERRED)
    if (!checkAlive<Date>(cache1)) {
        return 1
    }
    if (!checkAlive<Date>(cache2)) {
        return 2
    }
    0
}
