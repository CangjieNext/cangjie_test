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
//bigInt
main(): Int64 {
    var a: UInt64 = 10
    var b: UInt64 = 9223372036854775808
    var c: UInt64 = 0
    var d: UInt64 = 0
    var e: UInt64 = 9223372036854775818
    d = a | b
    if (d != e) {
        return 1
    }
    d = c | b
    if (d != b) {
        return 1
    }
    return 0
}
