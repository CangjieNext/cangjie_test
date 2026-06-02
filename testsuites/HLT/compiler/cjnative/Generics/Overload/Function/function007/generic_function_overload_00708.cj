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

open class Base {}

class Sub <: Base {}

func f(a: (Base) -> Int64, b: Base) {
    a(b)
} //f1

func f(a: (Sub) -> Int64, b: Sub) {
    a(b)
} //f2

func g(a: Base): Int64 {
    1
} //g1

func g(a: Sub): Int64 {
    2
} //g2

main(): Int64 {
    if (f(g, Base()) == 1) {
        return 0
    }
    return 1
}
