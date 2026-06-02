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
    var a = 0o1777777777777777777777u64
    var b = -0O0u64
    var c = 0o1777777777777777777777____________________u64
    var d = 0O0________u64

    if (!(a == 18446744073709551615 && a is UInt64)) {
        return 1
    }

    if (!(b == -0 && a is UInt64)) {
        return 2
    }

    if (!(c == 18446744073709551615 && a is UInt64)) {
        return 3
    }

    if (!(d == 0 && a is UInt64)) {
        return 4
    }

    return 0
}
