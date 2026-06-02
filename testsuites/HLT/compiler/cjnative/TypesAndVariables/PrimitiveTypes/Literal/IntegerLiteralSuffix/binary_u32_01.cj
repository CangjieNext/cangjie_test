/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var a = 0B1111_1111_1111_11111111_1111_1111_1111u32
    var b = 0B0u32
    var c = 0b1111_1111_1111_11111111_1111_1111_1111______u32
    var d = 0b0_u32

    if (!(a == 4294967295 && a is UInt32)) {
        return 1
    }

    if (!(b == 0 && a is UInt32)) {
        return 2
    }

    if (!(c == 4294967295 && a is UInt32)) {
        return 3
    }

    if (!(d == 0 && a is UInt32)) {
        return 4
    }

    return 0
}
