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

func temp(b: Int64) {
    return b - 1
}

func test() {
    var b = 1

    b = temp(b)
    var a = 1 / b
    return a
}

main() {
    test()
    1
}
