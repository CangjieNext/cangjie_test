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
// ASSERT:scan true

func add(a: Int32, b: Int32): Int32 {
    return a + b
}

main(): Int64 {
    // Create a thread.
    let fut: Future<Int32> = spawn {
        add(1, 2)
    }
    sleep(Duration.second)

    match (fut.tryGet()) {
        case None => print(false)
        case _ => print(true)
    }

    return 0
}
