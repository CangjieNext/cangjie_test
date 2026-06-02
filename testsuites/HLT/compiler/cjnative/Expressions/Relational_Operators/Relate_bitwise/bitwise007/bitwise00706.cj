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
    var a: Int64 = 10
    var b: Int64 = 1
    var c: Int64 = 0
    var d: Int64 = 28
    var e: Int64 = 8
    var f: Int64 = 15
    var g: Int64 = 24
    c = !!a << b ^ e & f | g
    if (c != d) {
        return c
    }
    return 0
}
