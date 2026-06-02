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
//fail 幂不支持
main(): Int64 {
    var a: UInt32 = 10
    var b = UInt32(2 ** 31) - 1
    var c: UInt32 = 0
    var d: UInt32 = 0
    d = a & b
    if (d != a) {
        return 1
    }
    d = b & c
    if (d != c) {
        return 1
    }
    return 0
}
