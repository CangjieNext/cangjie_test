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
    var a = 0O377u8
    var b = 0o0u8
    var c = 0O377__________u8
    var d = 0O0_u8

    if (!(a == 255 && a is UInt8)) {
        return 1
    }

    if (!(b == 0 && a is UInt8)) {
        return 2
    }

    if (!(c == 255 && a is UInt8)) {
        return 3
    }

    if (!(d == 0 && a is UInt8)) {
        return 4
    }

    return 0
}
