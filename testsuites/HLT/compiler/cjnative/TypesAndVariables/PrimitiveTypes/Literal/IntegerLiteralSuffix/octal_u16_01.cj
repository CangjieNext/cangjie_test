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
    var a = 0o177777u16
    var b = -0O00u16
    var c = 0o177777u16
    var d = 0o000000_u16

    if (!(a == 65535 && a is UInt16)) {
        return 1
    }

    if (!(b == 0 && a is UInt16)) {
        return 2
    }

    if (!(c == 65535 && a is UInt16)) {
        return 3
    }

    if (!(d == 0 && a is UInt16)) {
        return 4
    }

    return 0
}
