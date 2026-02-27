/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %export cjHeapSize=4MB && %run %run_opt %output %run_args 2>&1 | compare %f
// (not iOS) ASSERT: scan Out of memory
// (not CJNATIVE or iOS) ASSERT: scan OutOfMemoryError

import std.collection.*

class A {
    let x1 = 42
    let x2 = 42
    let x3 = 42
    let x4 = 42
    let x5 = 42
}

main() {
    var list = ArrayList<A>()
    while (true) {
        list.add(A())
    }
    return 0
}
