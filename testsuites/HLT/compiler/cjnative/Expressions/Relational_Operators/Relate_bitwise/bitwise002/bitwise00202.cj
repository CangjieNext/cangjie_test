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
    var a: UInt8 = 127
    var b: UInt8 = 0
    var c: UInt8 = 254
    var d: UInt8 = 0
    var e: UInt8 = 63
    var r: UInt8 = 1
    b = a << r
    if (b != c) {
        return 1
    }
    d = a >> r
    if (d != e) {
        return 1
    }
    return 0
}
