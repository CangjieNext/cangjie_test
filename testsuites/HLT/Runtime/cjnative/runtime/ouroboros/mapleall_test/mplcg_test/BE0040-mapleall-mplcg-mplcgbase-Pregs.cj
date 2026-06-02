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
// ASSERT:scan 5012334

func pregs_foo(i: Int32): Int32 {
    return (i + 3)
}

func pregs_fact(n: Int32, m: Float32): Int32 {
    var preg987: Int32 = 48
    if (preg987 != 10) {
        return pregs_foo(preg987 - 1)
    } else {
        preg987 = 111
        return 49
    }
}

func pregs_Fib(n: Int32): Int32 {
    if (n <= 2) {
        return n
    } else {
        return pregs_Fib(n - 1) + pregs_Fib(n - 2)
    }
}

main(): Int64 {
    print(pregs_fact(3, 0.2))
    print(pregs_Fib(1))
    print(pregs_Fib(2))
    print(pregs_Fib(3))
    print(pregs_Fib(8))
    return 0
}
