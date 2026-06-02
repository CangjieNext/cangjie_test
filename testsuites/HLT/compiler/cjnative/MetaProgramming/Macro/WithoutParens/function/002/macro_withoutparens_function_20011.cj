/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_macro_opt %run_args

import define.*
import std.ast.*

enum E {
    e
}

func x(input: Int64) {
    input
}

class A {}

@M
func test<T>(b: T, a!: Int64 = 1): T where T <: A {
    func foo<T>(input: T): T {
        input
    }
    var x = {input: T => input}
    {=> b}
    var c = 1
    c = 2
    var my_x = x ~> x
    c = c |> my_x
    true && true
    true || true
    a | a
    a ^ a
    a & a
    a + a - a * a / a % a ** a
    !true
    -a
    c++
    c--
    a >> a
    a << a
    a < a
    a <= a
    a > a
    a >= a
    a == a
    a != a
    x(1)
    var d = [a]
    d[0]
    var f = (a, a)
    f[0]
    if (true) {
        a
    } else {
        a
    }

    var e = E.e
    match (e) {
        case e where false => 0
        case x: Int64 => 1
        case _ => 2
    }
    match (1) {
        case a => 1
        case _ => 0
    }
    while (false) {
        a
    }
    do {
        ()
    } while (false)
    for (i in 0..10) {
        print("${a}")
        if (false) {
            continue
        } else {
            break
        }
    }
    quote(1)
    quote(1)
    Rune(1)
    UInt32('1')
    return b
}

main() {
    return test()
}
