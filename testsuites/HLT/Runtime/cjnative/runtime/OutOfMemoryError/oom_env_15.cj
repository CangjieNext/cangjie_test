/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// (not Android and not iOS) EXEC: %compiler %cmp_opt %f -o %output
// (not Android and not iOS) RUN-EXEC: %export cjHeapDumpOnOOM=on && %export cjHeapDumpLog=./test.info && %run %run_opt %output %run_args 2>&1 | compare %f
// (not Android and not iOS) ASSERT: scan Failed to open heap dump file, stop dumping heap info, No such file or directory

import std.collection.*
import std.sync.*
import std.time.*
import std.runtime.*

var num = AtomicInt64(0)

class A {
    let x1 = 1.0
    let x2 = 1.0
    let x3 = 1.0
    let x4 = 1.0
    let x5 = 1.0
}

main(): Int64 {
    var list = ArrayList<A>()
    try {
        while (true) {
            list.add(A())
        }
    } catch (_: OutOfMemoryError) {
        return 0
    }
    return 1
}
