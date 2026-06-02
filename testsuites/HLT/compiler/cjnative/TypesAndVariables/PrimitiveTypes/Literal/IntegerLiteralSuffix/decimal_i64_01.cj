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
    var a = 9223372036854775807i64
    var b = -9223372036854775808i64
    var c = 9223372036854775807_i64
    var d = -9223372036854775808_i64

    if (!(a == 9223372036854775807 && a is Int64)) {
        return 1
    }

    if (!(b == -9223372036854775808 && a is Int64)) {
        return 2
    }

    if (!(c == 9223372036854775807 && a is Int64)) {
        return 3
    }

    if (!(d == -9223372036854775808 && a is Int64)) {
        return 4
    }

    return 0
}
