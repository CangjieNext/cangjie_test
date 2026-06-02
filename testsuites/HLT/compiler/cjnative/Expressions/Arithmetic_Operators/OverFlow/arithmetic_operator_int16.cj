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
    var a1: Int16 = -32768 - 1 + 1
    var a2: Int16 = -32768 - 1
    var a3: Int16 = -32768 + 1
    var a4: Int16 = -(-32768)
    var a5: Int16 = 32767 + 1 - 1
    var a6: Int16 = 32767 + 1
    var a7: Int16 = 32767 - 1
    var a8: Int16 = 1 + 32767
    var a9: Int16 = 32767 * 3 / 3
    var a10: Int16 = 32767 * 0
    var a11: Int16 = (-32768) * 3 / 3
    var a12: Int16 = 16384 * 2
    var a13: Int16 = (-16385) * 2
    var a14 = Int16(2 ** 15)
    return 0
}
// ASSERT: scan chir_arithmetic_operator_overflow
