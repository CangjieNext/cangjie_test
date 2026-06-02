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

// ASSERT: scan This is main\nThis is a new thread, sum = 7\nThis is a new thread, sum = 10\n

var sum: Int32 = 0

func add(a: Int32, b: Int32): Int32 {
    sum = sum + a + b
    print("This is a new thread, sum = ${sum}\n")
    return sum
}

main(): Int64 {
    print("This is main\n")
    // Create a thread.
    let fut1: Future<Int32> = spawn {
        sleep(Duration.millisecond * 300)
        add(1, 2)
    }
    let fut2: Future<Int32> = spawn {
        sleep(Duration.millisecond * 100)
        add(3, 4)
    }
    sleep(Duration.second)
    if (sum != 10) {
        return 2
    }
    return 0
}
