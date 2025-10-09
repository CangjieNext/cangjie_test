/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan StackOverflowError

func test(i: Int64): Int64 {
    if (i == 0) {
        return 0
    }
    return i + test(i + 1)
}

main(): Int64 {
    let fut: Future<Int64> = spawn {
        test(1)
    }

    var result: Int64 = fut.get()
    print("result = ${result}\n")
    return 0
}
