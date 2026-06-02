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
    var a = 0o37777777777u32
    var b = 0O0u32
    var c = 0o37777777777____________u32
    var d = 0O0u32

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
