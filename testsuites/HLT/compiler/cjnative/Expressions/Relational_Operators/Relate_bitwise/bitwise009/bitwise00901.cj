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
    var a = !10
    var b = !20
    var c1 = 10 << 1
    let c2 = 10 << Int32(1) << Int64(1.10001)
    let d = 10 >> 1
    var e = 10 & 15
    var f = 10 ^ 15
    var g = 10 | 15
    var h = 1 ^ 8 & 15 | 24

    if (a != -11) {
        return 1
    }
    if (b != -21) {
        return 1
    }
    if (c1 != 20) {
        return 1
    }
    if (c2 != 40) {
        return 1
    }
    if (d != 5) {
        return 1
    }
    if (e != 10) {
        return 1
    }
    if (f != 5) {
        return 1
    }
    if (g != 15) {
        return 1
    }
    if (h != 25) {
        return 1
    }
    return 0
}
