/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (!O2) EXEC: %compiler %cmp_opt %f -o %output
// (!O2) RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// (!O2) ASSERT: scan ArithmeticException: Divided by zero!

// (O2) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (O2) ASSERT: scan chir_divisor_is_zero

func cond() {
    return true
}

func test() {
    var temp1 = 1
    if (cond()) {
        temp1 = 0
    } else {
        temp1 = 1
    }
    var a = temp1 / temp1
    return a
}

main() {
    test()
    1
}
