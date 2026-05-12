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
    var a = -128 + 567 * 3 / 4 - 3 % 3 ** 3
    var b = (-128 + 567) * 3 / 4 - 3 % (-3) ** 2
    var c: Float64 = Float64(-128 + -567) * 3.0 / 4.0 - Float64(3 % -3 ** 3)
    //var d = Float64(0b11*0x18**0b11/2)+Float64(0o30)%0x1.1p0- -2.4e-1
    a++;
    a--
    b++;
    b--
    if (a != 294) {
        return 1
    }
    if (b != 326) {
        return 2
    }
    if (c != -524.25) {
        return 3
    }
    /* if (d != 20736.865) {
        return 4
    } */
    return 0
}
