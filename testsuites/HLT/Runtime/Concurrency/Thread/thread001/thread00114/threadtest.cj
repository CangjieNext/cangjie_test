/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// ( not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f

// ASSERT: scan This is a new thread\nin main thread, sum = 0\n

var sum: Int32 = 0

func add(a: Int32, b: Int32): Unit {
    sum = a + b
    print("sum = ${sum}\n")
}

main(): Int64 {
    let fut1: Future<Unit> = spawn {
        print("This is a new thread\n")
        sleep(Duration.millisecond * 2000)
        add(1, 2)
    }
    sleep(Duration.second)
    print("in main thread, sum = ${sum}\n")
    if (sum != 0) {
        return 1
    }
    return 0
}
