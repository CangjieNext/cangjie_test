/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
open class test {}

open class A <: test {}

class B <: A {}

interface I {}

extend B <: I {}

main() {
    let ins: I = B()
    var a1 = match (ins) {
        case _: A => 0
        case _ => 1
    }
    var a2 = match (ins) {
        case _: B => 0
        case _ => 1
    }
    var a3 = match (ins) {
        case _: test => 0
        case _ => 1
    }
    return a1 + a2 + a3
}
