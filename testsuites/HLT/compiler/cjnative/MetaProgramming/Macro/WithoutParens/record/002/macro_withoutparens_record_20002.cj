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

class D {}

enum E {
    e
}

func x(input: Int64) {
    input
}

@M
struct A<T> where T <: D {
    public var a: T
    private let b: Int64 = 1
    static let c: Int64 = 1
    private init(input: T) {
        this.a = input
    }
    public init(input: T, input_b: Int64) {
        var temp = input
        this.a = input
    }
    static func x<X>() {}
    private func y() {}
    public func z() {}
    operator func +(b: A<T>) {
        0
    }
    func test(b: T, a!: Int64 = 1): T {
        func foo<T>(input: T): T {
            input
        }
        var y = {input: T => input}
        {=> b}
        var c = 1
        c = 2
        var my_x = x ~> x
        c = c |> my_x
        true && true
        true || true
        //        true^^true
        a | a
        a ^ a
        a & a
        a + a - a * a / a % a ** UInt64(a)
        !true
        !a
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

        var e1 = E.e
        match (e1) {
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
        Rune(1)
        UInt32(r'1')
        return b
    }
}

main() {
    A<D>(D(), 1)
    return 0
}
