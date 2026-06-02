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

interface I1 {}

interface I2 <: I1 {}

struct C1 {}

struct C2 {}

extend C1 <: I1 {}

extend C2 <: I2 {}

main() {
    var a = if (true) {
        C1()
    } else {
        C2()
    }
    var res = match (a) {
        case x: I1 => 0
        case _ => 1
    }
    return res
}
