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
    var a1: UInt32 = 0 - 1 + 1
    var a2: UInt32 = 0 - 1
    var a3: UInt32 = 1 + 1
    var a4: UInt32 = -(-0)
    var a5: UInt32 = 4294967295 + 1 - 1
    var a6: UInt32 = 4294967295 + 1
    var a7: UInt32 = 4294967295 - 1
    var a8: UInt32 = 1 + 4294967295
    var a9: UInt32 = 4294967295 * 3 / 3
    var a10: UInt32 = 4294967295 * 0
    var a11: UInt32 = (0) * 3 / 3
    var a12: UInt32 = 2147483648 * 2
    var a13: UInt32 = (-0) * 2
    var a14 = UInt32(2 ** 32)
    var a15: UInt32 = -0
    return 0
}
// ASSERT: scan chir_arithmetic_operator_overflow
