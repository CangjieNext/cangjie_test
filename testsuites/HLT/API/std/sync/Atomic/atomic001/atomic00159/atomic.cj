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
// ASSERT: scan 65408

import std.sync.*

main(): Int64 {
    let test = AtomicUInt16(65535)

    let thread1: Future<UInt16> = spawn {
        test.fetchXor(1)
    }

    let thread2: Future<UInt16> = spawn {
        test.fetchXor(2)
    }

    let thread3: Future<UInt16> = spawn {
        test.fetchXor(4)
    }

    let thread4: Future<UInt16> = spawn {
        test.fetchXor(8)
    }

    let thread5: Future<UInt16> = spawn {
        test.fetchXor(16)
    }

    let thread6: Future<UInt16> = spawn {
        test.fetchXor(32)
    }

    let thread7: Future<UInt16> = spawn {
        test.fetchXor(64)
    }

    while (test.load() != 65408) {
        sleep(Duration.Zero)
    }
    print(test.load().toString())
    return 0
}
