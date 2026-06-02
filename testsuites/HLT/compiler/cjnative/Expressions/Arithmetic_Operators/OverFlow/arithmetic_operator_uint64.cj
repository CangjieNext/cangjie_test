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
    var a1: UInt64 = 0 - 1 + 1
    var a2: UInt64 = 0 - 1
    var a3: UInt64 = 1 + 1
    var a4: UInt64 = -(-0)
    var a5: UInt64 = 18446744073709551615 + 1 - 1
    var a6: UInt64 = 18446744073709551615 + 1
    var a7: UInt64 = 18446744073709551615 - 1
    var a8: UInt64 = 1 + 18446744073709551615
    var a9: UInt64 = 18446744073709551615 * 3 / 3
    var a10: UInt64 = 18446744073709551615 * 0
    var a11: UInt64 = (0) * 3 / 3
    var a12: UInt64 = 9443372036854775808 * 2
    var a13: UInt64 = (-0) * 2
    var a14 = UInt64(2 ** 64)
    var a15: UInt64 = -0
    return 0
}
// ASSERT: scan chir_arithmetic_operator_overflow
