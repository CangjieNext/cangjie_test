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
    var a: Int32 = 100
    var b: Int32 = 0
    var c: Int32 = 102400
    var d: Int32 = 0
    var r: Int32 = 10
    b = a << r
    if (b != c) {
        return 1
    }
    d = c >> r
    if (d != a) {
        return 1
    }
    return 0
}
