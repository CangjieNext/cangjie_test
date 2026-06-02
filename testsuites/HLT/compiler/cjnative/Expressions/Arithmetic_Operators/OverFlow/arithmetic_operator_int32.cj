/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

main(): Int64 {
    var a1: Int32 = -2147483648 - 1 + 1
    var a2: Int32 = -2147483648 - 1
    var a3: Int32 = -2147483648 + 1
    var a4: Int32 = -(-2147483648)
    var a5: Int32 = 2147483647 + 1 - 1
    var a6: Int32 = 2147483647 + 1
    var a7: Int32 = 2147483647 - 1
    var a8: Int32 = 1 + 2147483647
    var a9: Int32 = 2147483647 * 3 / 3
    var a10: Int32 = 2147483647 * 0
    var a11: Int32 = (-2147483648) * 3 / 3
    var a12: Int32 = 1073741824 * 2
    var a13: Int32 = (-1073741825) * 2

    return 0
}
// ASSERT: scan chir_arithmetic_operator_overflow
