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

class A {
    static var a = 7
    static var b = 0
}

func f(x: Int64): Int64 {
    x
}

main(): Int64 {
    A.a &= A.b |> f
    if (A.a != 0) {
        return 1
    }
    A.a |= (A.b + 3) |> f
    if (A.a != 3) {
        return 2
    }
    A.a <<= (A.b + 1) |> f
    if (A.a != 6) {
        return 3
    }
    A.a >>= (A.b + 2) |> f
    if (A.a != 1) {
        return 4
    }
    return 0
}
