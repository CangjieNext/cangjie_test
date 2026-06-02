/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT:scan GCGCGC
// ASSERT:scan-not main end

import std.time.*
import std.sync.*
import std.runtime.*

main(): Unit {
    println("main start")

    for (i in 0..100000) {
        GC()
    }
    throw Exception("GCGCGC")
    sleep(Duration.second)
    println("main end")
}
