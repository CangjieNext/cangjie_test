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
    var a: Int32 = 10
    var b: Int32 = -2147483648
    var c: Int32 = 0
    var d: Int32 = 0
    d = a & b
    if (d != c) {
        return 1
    }
    d = b & c
    if (d != c) {
        return 1
    }
    return 0
}
