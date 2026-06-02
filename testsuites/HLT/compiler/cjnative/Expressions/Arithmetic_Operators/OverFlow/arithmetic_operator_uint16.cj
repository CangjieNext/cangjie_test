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
    var a1: UInt16 = 0 - 1 + 1
    var a2: UInt16 = 0 - 1
    var a3: UInt16 = 1 + 1
    var a4: UInt16 = -(-0)
    var a5: UInt16 = 65535 + 1 - 1
    var a6: UInt16 = 65535 + 1
    var a7: UInt16 = 65535 - 1
    var a8: UInt16 = 1 + 65535
    var a9: UInt16 = 65535 * 3 / 3
    var a10: UInt16 = 65535 * 0
    var a11: UInt16 = (0) * 3 / 3
    var a12: UInt16 = 32768 * 2
    var a13: UInt16 = (-0) * 2

    var a15: UInt16 = -0
    return 0
}
// ASSERT: scan chir_arithmetic_operator_overflow
