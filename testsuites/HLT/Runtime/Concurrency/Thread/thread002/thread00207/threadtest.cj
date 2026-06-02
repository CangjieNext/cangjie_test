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

// ASSERT: scan result = 1, 2\n
// ASSERT: scan-not Exception

main(): Int64 {
    var result: (Int32, Int32) = (0, 1)

    let fut: Future<(Int32, Int32)> = spawn {
        return (1, 2)
    }

    result = fut.get()

    if (result[0] != 1 || result[1] != 2) {
        return 1
    }

    match (fut.tryGet()) {
        case None => return 1
        case _ => ()
    }

    print("result = ${result[0]}, ${result[1]}\n")
    return 0
}
