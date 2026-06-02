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
// ASSERT:scan 5813

func test(nth: Int32): Int32 {
    if (nth < 2) {
        return nth
    } else {
        return test(nth - 1) + test(nth - 2)
    }
}

main(): Int64 {
    print(test(5).toString())
    print(test(6).toString())
    print(test(7).toString())
    return 0
}
