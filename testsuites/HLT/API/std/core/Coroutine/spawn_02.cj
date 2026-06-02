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
// ASSERT:scan 33

var sum: Int32 = 0

func add(a: Int32, b: Int32): Int32 {
    sum = a + b
    print(sum.toString())
    return sum
}

main(): Int64 {
    spawn {add(1, 2)}
    sleep(Duration.second);
    print(sum.toString())
    if (sum != 3) {
        return 1
    }
    return 0
}
