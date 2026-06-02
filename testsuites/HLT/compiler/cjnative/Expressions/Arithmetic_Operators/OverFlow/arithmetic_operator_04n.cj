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
    var a2: Int8 = 127 * 3 / 3
    var b1: Int16 = -32768 * 2 / 2
    var b2: Int16 = 32767 + 1 - 1
    var c1: Int32 = -2147483648 - 1 + 1
    var c2: Int32 = 2147483647 * 2 / 2
    var d1: Int64 = (9223372036854775807 ** 3) ** 3
    var d2: Int64 = 9223372036854775807 * 2 / 2
    return 0
}
// ASSERT: scan chir_arithmetic_operator_overflow
