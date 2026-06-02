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
    var a = 32767i16
    var b = -32768i16
    var c = 32767_i16
    var d = -32768_i16

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
