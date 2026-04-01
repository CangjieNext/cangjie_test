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

// ASSERT: scan num = 5\n

var result = 0..10

main(): Int64 {
    let fut1: Future<Unit> = spawn {
        result = 0..5
    }
    sleep(Duration.second);
    var num = 0
    for (i in result) {
        num = num + 1
    }
    if (num != 5) {
        return 1
    }
    print("num = ${num}\n")
    return 0
}
