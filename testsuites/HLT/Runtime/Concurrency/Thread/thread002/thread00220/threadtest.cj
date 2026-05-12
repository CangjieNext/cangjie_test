/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

// ASSERT: scan result = 2\n
// ASSERT: scan-not Exception

main(): Int64 {
    var result: Int32 = 1

    let fut: Future<Int32> = spawn {
        let a: Int32 = 2
        return a
    }

    result = fut.get()

    if (result != 2) {
        return 1
    }

    match (fut.tryGet()) {
        case None => return 1
        case _ => ()
    }

    print("result = ${result}\n")
    return 0
}
