/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 3

func add(a: Int32, b: Int32): Int32 {
    // print("This is a new thread")
    return a + b
}

main(): Int64 {
    // print("This is main\n")
    // Create a thread.
    let fut: Future<Int32> = spawn {
        add(1, 2)
    }
    // print("main waiting...\n")
    // Waiting for the results of thread execution.
    try {
        let res: Int32 = fut.get()
        // Print the result.
        print("${res}")
    } catch (e: Exception) {
        print("oops")
    }
    return 0
}
