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
    var a1: Int8 = -128 - 1 + 1
    var a2: Int8 = -128 - 1
    var a3: Int8 = -128 + 1
    var a4: Int8 = -(-128)
    var a5: Int8 = 127 + 1 - 1
    var a6: Int8 = 127 + 1
    var a7: Int8 = 127 - 1
    var a8: Int8 = 1 + 127
    var a9: Int8 = 127 * 3 / 3
    var a10: Int8 = 127 * 0
    var a11: Int8 = (-128) * 3 / 3
    var a12: Int8 = 64 * 2
    var a13: Int8 = (-65) * 2
    var a14 = Int8(2 ** 7)
    return 0
}
// ASSERT: scan chir_arithmetic_operator_overflow
