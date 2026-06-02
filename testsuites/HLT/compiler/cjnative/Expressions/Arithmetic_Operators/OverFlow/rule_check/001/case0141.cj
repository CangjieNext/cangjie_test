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
// (!O2) ASSERT: scan OverflowException: add

// (O2) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (O2) ASSERT: scan chir_arithmetic_operator_overflow

func cond() {
    return true
}

func a() {
    var a: Int8 = 10
    if (cond()) {
        a = 20
    } else {
        a = 30
    }
    var b: Int8 = 120 + a
    return b
}

main() {
    a()
    return 0
}
