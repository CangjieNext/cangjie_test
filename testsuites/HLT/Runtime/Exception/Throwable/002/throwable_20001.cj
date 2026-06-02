/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output

main() {
    var n = 2
    var res = 3
    try {
        n = n / (n - 2)
    } catch (e: ArithmeticException) {
        print("catch!");
        e.printStackTrace()
    } finally {
        res = 0
    }
    return res
}
// ASSERT: scan chir_divisor_is_zero
