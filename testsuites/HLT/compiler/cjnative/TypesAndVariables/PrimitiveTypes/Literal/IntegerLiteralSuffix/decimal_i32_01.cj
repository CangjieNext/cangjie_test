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
    var a = 2147483647i32
    var b = -2147483648i32
    var c = 2147483647_i32
    var d = -2147483648_i32

    if (!(a == 2147483647 && a is Int32)) {
        return 1
    }

    if (!(b == -2147483648 && a is Int32)) {
        return 2
    }

    if (!(c == 2147483647 && a is Int32)) {
        return 3
    }

    if (!(d == -2147483648 && a is Int32)) {
        return 4
    }

    return 0
}
