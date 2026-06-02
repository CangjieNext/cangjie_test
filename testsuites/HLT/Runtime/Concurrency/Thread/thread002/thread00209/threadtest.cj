/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// ( not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f

// ASSERT: scan result = () -> Int64\nfinish\n
// ASSERT: scan-not Exception

main(): Int64 {
    let fut: Future<() -> Int64> = spawn {
        {=> return 1}
    }

    fut.get()
    print("result = () -> Int64\n")

    match (fut.tryGet()) {
        case None => return 1
        case _ => ()
    }

    print("finish\n")
    return 0
}
