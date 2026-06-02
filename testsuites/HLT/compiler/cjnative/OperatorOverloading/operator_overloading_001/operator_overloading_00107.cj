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

interface A {
    operator func +(inputB: A): Int64 {
        return 0
    }
}

interface C <: A {
    operator func +(inputB: C): Int64 {
        return 0
    }
}

class B <: C {}

main(): Int64 {
    let a: A = B()
    return (a + a)
}
