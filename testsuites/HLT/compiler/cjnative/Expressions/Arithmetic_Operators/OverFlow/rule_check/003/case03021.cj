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
    var temp = true
    return temp
}

func temp() {
    var res = 1
    return res
}

func test() {
    var a = 1
    if (cond()) {
        a = temp() - 1
    } else {
        a = temp() - 1
    }
    var b = 1 / a
    return b
}

main() {
    test()
    1
}
