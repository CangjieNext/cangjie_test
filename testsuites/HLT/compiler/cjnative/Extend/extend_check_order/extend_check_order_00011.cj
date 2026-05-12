/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-1: %run %run_opt %output %run_args


interface I1 {
    static prop v: Int64 {
        get() {
            0
        }
    }
}

interface I2 <: I1 {
    static prop v: Int64 {
        get() {
            1
        }
    }
}

enum A {
    | RED
}

extend A <: I1 {}

extend A <: I2 {}

main(): Int64 {
    var res = A.v
    return res
}
