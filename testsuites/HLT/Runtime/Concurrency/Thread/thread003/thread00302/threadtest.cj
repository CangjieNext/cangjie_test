/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

// ASSERT: scan result > 1000\n
// ASSERT: scan-not Exception

import std.sync.*

let result = AtomicInt64(0)

func test(): Unit {
    result.fetchAdd(1)
    if (result.load() <= 1000) {
        test()
    }
}

main(): Int64 {
    var count: Int64 = 0
    while (count < 1000) {
        count = count + 1
        let fut: Future<Unit> = spawn {
            test()
            print("in thread\n")
        }
    }

    while (result.load() <= 1000) {
        sleep(Duration.Zero)
    }

    print("result > 1000\n")
    return 0
}
