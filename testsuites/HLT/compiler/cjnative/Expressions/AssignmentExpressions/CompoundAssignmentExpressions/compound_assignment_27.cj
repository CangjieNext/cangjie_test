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
    static var a = 1
    static var b = 4
}

func f(x: Int64): Int64 {
    x + 1
}

main(): Int64 {
    A.b += A.a |> f
    if (A.b != 6) {
        return 1
    }
    A.b -= A.a |> f
    if (A.b != 4) {
        return 2
    }
    A.b **= UInt64(A.a |> f)
    if (A.b != 16) {
        return 3
    }
    A.b *= A.a |> f
    if (A.b != 32) {
        return 4
    }
    A.b /= A.a |> f
    if (A.b != 16) {
        return 5
    }
    A.b %= A.a |> f
    if (A.b != 0) {
        return 6
    }
    return 0
}
