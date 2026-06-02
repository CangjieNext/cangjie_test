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
    var a1: UInt8 = 0 - 1 + 1
    var a2: UInt8 = 0 - 1
    var a3: UInt8 = 1 + 2
    var a4: UInt8 = -(-0)
    var a5: UInt8 = 255 + 1 - 1
    var a6: UInt8 = 255 + 1
    var a7: UInt8 = 255 - 1
    var a8: UInt8 = 1 + 255
    var a9: UInt8 = 255 * 3 / 3
    var a10: UInt8 = 255 * 0
    var a11: UInt8 = (0) * 3 / 3
    var a12: UInt8 = 128 * 2
    var a13: UInt8 = (-0) * 2

    var a15: UInt8 = -0
    return 0
}
// ASSERT: scan chir_arithmetic_operator_overflow
