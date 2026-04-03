/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %export CANGJIE_MAX_CONCURRENCY=1 && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan result = 1\n
// ASSERT: scan-not Exception

import std.sync.*

main(): Int64 {
    let result = AtomicInt64(0)

    let fut1: Future<Unit> = spawn {
        print("in thread\n")
        while (true) {}
    }

    let fut2: Future<Unit> = spawn {
        sleep(Duration.second)
        result.fetchAdd(1)
        while (true) {}
    }

    while (result.load() != 1) {
        sleep(Duration.Zero)
    }

    print("result = ${result.load()}\n")
    return 0
}
