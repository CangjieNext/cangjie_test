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

func f(a: (Base) -> Int64, b: Sub) {
    return a(Base()) + 1
} //f1

func f(a: (Sub) -> Int64, b: Base) {
    return a(Sub()) + 2
} //f2

func g(a: Base): Int64 {
    return 1
} //g1

func g(a: Sub): Int64 {
    return 2
} //g2

main(): Int64 {
    var i = f(g, Sub())
    if (i != 2) {
        return 1
    }
    return 0
}
