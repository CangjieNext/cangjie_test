/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: extend_pkg_01.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt extend_pkg_01.cj -o extend_pkg_01.%middle  
// EXEC: %compiler %cmp_opt %f extend_pkg_01.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import p1.*

interface I1 {}

interface I2 {}

extend B <: I1 & I2 {}

main() {
    let ins: I1 = B()
    var a1 = match (ins) {
        case _: A => 0
        case _ => 1
    }
    var a2 = match (ins) {
        case _: B => 0
        case _ => 1
    }
    var a3 = match (ins) {
        case _: I2 => 0
        case _ => 1
    }
    return a1 + a2 + a3
}
