/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f -o %output
// (not Windows or OHOS) mkdir -p test_11 && %export cjHeapDumpOnOOM=on && %export cjHeapDumpLog=./test_11 && %run %run_opt %output %run_args & %run %output & %run %output & %run %output && RUN-EXEC: ls ./test_11/cj_OOM_pid*.dat
// (Windows and not OHOS) mkdir -p test_11 && %export cjHeapDumpOnOOM=on && %export cjHeapDumpLog=./test_11 && %run %run_opt %output %run_args & %run %output & %run %output & %run %output && RUN-EXEC: %ls ./test_11/cj_OOM_pid*.dat

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
