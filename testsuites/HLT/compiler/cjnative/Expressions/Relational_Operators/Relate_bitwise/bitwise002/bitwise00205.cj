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
    var a: Int64 = -2147483648
    var b: Int64 = 0
    var c: Int64 = -8796093022208
    var d: Int64 = 1
    var e: Int64 = -1073741824
    var r: Int64 = 12
    b = a << r
    if (b != c) {
        return 1
    }
    d = a >> d
    if (d != e) {
        return 1
    }
    return 0
}
