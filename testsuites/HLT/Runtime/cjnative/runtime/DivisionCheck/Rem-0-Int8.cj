/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %overflow_wrapping %f -o %output 2>&1 | compare %f

main() {
    try {
        var a = 2 % Int8(0)
    } catch (e: ArithmeticException) {
        println(0)
    }
    return 0
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_divisor_is_zero
