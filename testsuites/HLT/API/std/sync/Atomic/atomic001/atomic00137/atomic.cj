/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC:%compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 0\n

import std.sync.*

main(): Int64 {
    let test = AtomicInt64(-1)

    let thread1: Future<Int64> = spawn {
        test.fetchAnd(126)
    }

    let thread2: Future<Int64> = spawn {
        test.fetchAnd(125)
    }

    let thread3: Future<Int64> = spawn {
        test.fetchAnd(123)
    }

    let thread4: Future<Int64> = spawn {
        test.fetchAnd(119)
    }

    let thread5: Future<Int64> = spawn {
        test.fetchAnd(111)
    }

    let thread6: Future<Int64> = spawn {
        test.fetchAnd(95)
    }

    let thread7: Future<Int64> = spawn {
        test.fetchAnd(63)
    }

    while (test.load() != 0) {
        sleep(Duration.Zero)
    }
    print(test.load().toString() + "\n")
    return 0
}
