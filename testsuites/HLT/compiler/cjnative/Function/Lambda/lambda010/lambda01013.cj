/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

func f(x: Int64): Float64 {
    Float64(x)
}

func g(x: Float64): Float64 {
    x
}

main(): Int64 {
    let ff = {
        a =>
        let fg = f ~> g
        fg(a)
    }
    if (ff is (Int64) -> Float64) {
        return 0
    }
    return 1
}
