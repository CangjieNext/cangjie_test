/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



var sum: Int32 = 0

func add(a: Int32, b: Int32): Int32 {
    print("This is a new thread\n")
    sum = a + b
    return sum
}

main(): Int64 {
    print("This is main\n")
    // Create a thread.
    let fut: Future<Int32> = spawn { a: Int32, b: Int32 => add(a, b) } 
    if (sum != 3 ) {
        return 1
    }
    return 0
}
// ASSERT: scan parse_expected_no_arguments_in_spawn
