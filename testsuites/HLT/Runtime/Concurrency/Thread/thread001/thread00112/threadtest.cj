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

// ASSERT: scan sum = 0

var sum: Int32 = 0

func add(): Unit {
    sum = sum + 1
}

main(): Int64 {
    let fut: Future<Unit> = spawn {
        sleep(Duration.nanosecond * 9223372036854775807)
        add()
    }
    sleep(Duration.second)
    print("sum = ${sum}")
    return 0
}
