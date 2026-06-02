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
    var i1: UInt8 = 2
    var i2: UInt16 = 3
    var i3: UInt32 = 4
    var i4: UInt64 = 4
    var i5: UInt8 = 255
    var i6: UInt16 = 65534 + 1
    var i7: UInt32 = 4294967293 + 2
    var i8 = Int64(9223372036854775806 ** 2)
    return 0
}

// ASSERT: scan chir_arithmetic_operator_overflow
