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
    var a = 0b111_1111_1111_1111i16
    var b = -0B1000_0000_0000_0000i16
    var c = 0b111_1111_1111_1111_i16
    var d = -0B1000_0000_0000_0000_i16

    if (!(a == 32767 && a is Int16)) {
        return 1
    }

    if (!(b == -32768 && a is Int16)) {
        return 2
    }

    if (!(c == 32767 && a is Int16)) {
        return 3
    }

    if (!(d == -32768 && a is Int16)) {
        return 4
    }

    return 0
}
