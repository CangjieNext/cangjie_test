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
    var a: Int8 = 7
    var b: Int8 = 2
    var c: Int8 = 0
    var d: Int8 = 0
    var e: Int8 = 10
    c = a & e >> b
    d = a & (e >> b)
    if (c != d) {
        return 1
    }
    return 0
}
