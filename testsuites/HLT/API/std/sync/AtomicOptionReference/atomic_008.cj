/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.sync.*

class A {}

main(): Int64 {
    let a = Some(A())
    let atomicRef = AtomicOptionReference<A>(a)
    let thread = spawn {
        if (atomicRef.compareAndSwap(a, Option<A>.None)) {
            atomicRef.load().getOrThrow()
        }
    }
    try {
        thread.get()
    } catch (_: NoneValueException) {
        return 0
    }
    return 1
}
