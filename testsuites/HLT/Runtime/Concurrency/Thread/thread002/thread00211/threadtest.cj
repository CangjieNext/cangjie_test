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

// ASSERT: scan result = Time.Month\n
// ASSERT: scan-not Exception

enum Time {
    Year | Month | Day | Hour
}

main(): Int64 {
    var result: Time = Time.Year

    let fut: Future<Time> = spawn {
        var result: Time = Time.Month
        return result
    }

    result = fut.get()

    match (fut.tryGet()) {
        case None => return 1
        case _ => ()
    }

    match (result) {
        case Year => print("result = Time.Year\n")
        case Month => print("result = Time.Month\n")
        case Day => print("result = Time.Day\n")
        case Hour => print("result = Time.Hour\n")
    }

    return 0
}
