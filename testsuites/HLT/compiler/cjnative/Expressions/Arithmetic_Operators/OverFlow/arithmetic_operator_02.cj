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
    var a: Int64 = -3 * -4 ** 3

    var c: Int64 = -2 ** 2 - 1
    var d = 2 ** 2 + 100 / 2 % 3 - 1
    var g = -2 ** UInt64(2 ** UInt64(2 ** 2))
    a++
    a--
    c++;
    c--
    d++;
    d--
    var h = Float32(-2.0 ** (-1.0) * 2.0)
    if (a != 192) {
        return 1
    }
    if (c != 3) {
        return 2
    }
    if (d != 5) {
        return 3
    }
    if (g != 65536) {
        return 4
    }
    if (h != -1.0) {
        return 5
    }

    return 0
}
