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

type A<T> = enumA<T>

enum enumA<T> {
    B(T)
    | C((T, T))
}

interface I {
    static func a() {
        10
    }
}

type TI = I

extend<T> A<T> <: TI {}

main(): Int64 {
    var a: enumA<Int64> = enumA<Int64>.B(enumA<Int64>.a())
    var b: enumA<Int64> = match (a) {
        case B(x) => C((x, x))
        case _ => B(1)
    }
    var c: (Int64, Int64) = match (b) {
        case C(x) => x
        case _ => (1, 2)
    }
    if (c[0] == c[1] && c[1] == 10) {
        return 0
    } else {
        return 1
    }
}
