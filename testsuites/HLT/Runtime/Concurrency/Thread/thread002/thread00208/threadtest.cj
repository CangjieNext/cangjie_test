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

// ASSERT: scan result = 0..2:1\n
// ASSERT: scan-not Exception

main(): Int64 {
    var result: Range<Int64> = 0..1 : 1
    var range: Range<Int64> = 0..2 : 1

    let fut: Future<Range<Int64>> = spawn {
        var a: Range<Int64> = 0..2 : 1
        return a
    }

    result = fut.get()

    if (result != range) {
        return 1
    }

    match (fut.tryGet()) {
        case None => return 1
        case _ => ()
    }

    print("result = 0..2:1\n")
    return 0
}
