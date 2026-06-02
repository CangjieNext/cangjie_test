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
    var a = 127i8
    var b = -128i8
    var c = 127_i8
    var d = -128_i8

    if (!(a == 127 && a is Int8)) {
        return 1
    }

    if (!(b == -128 && a is Int8)) {
        return 2
    }

    if (!(c == 127 && a is Int8)) {
        return 3
    }

    if (!(d == -128 && a is Int8)) {
        return 4
    }

    return 0
}
