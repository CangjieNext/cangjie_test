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
    var a1: Int64 = -9223372036854775808 - 1 + 1
    var a2: Int64 = -9223372036854775808 - 1
    var a3: Int64 = -9223372036854775808 + 1
    var a4: Int64 = -(-9223372036854775808)
    var a5: Int64 = 9223372036854775807 + 1 - 1
    var a6: Int64 = 9223372036854775807 + 1
    var a7: Int64 = 9223372036854775807 - 1
    var a8: Int64 = 1 + 9223372036854775807
    var a9: Int64 = 9223372036854775807 * 3 / 3
    var a10: Int64 = 9223372036854775807 * 0
    var a11: Int64 = (-9223372036854775808) * 3 / 3
    var a12: Int64 = 4612686018427387904 * 2
    var a13: Int64 = (-4612686018427387905) * 2
    var a14: Int64 = 2 ** 63
    return 0
}
// ASSERT: scan chir_arithmetic_operator_overflow
