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
// ASSERT:scan 100

main(): Int64 {
    var fut = spawn {
        sleep(Duration.second) // task sleep 1s
        return 100
    }
    var result: Int64 = 0
    try {
        result = fut.get()
    } catch (e: Exception) {
        print("Exception occured: ${e}\n")
    }
    print("${result}")
    return 0
}
