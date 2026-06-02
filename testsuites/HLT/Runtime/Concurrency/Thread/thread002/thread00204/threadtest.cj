/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

// ASSERT: scan result = true\n
// ASSERT: scan-not Exception

main(): Int64 {
    var result: Bool = false

    let fut: Future<Bool> = spawn {
        var a: Bool = true
        return a
    }

    result = fut.get()

    if (!result) {
        return 1
    }
    print("result = ${result}\n")
    return 0
}
