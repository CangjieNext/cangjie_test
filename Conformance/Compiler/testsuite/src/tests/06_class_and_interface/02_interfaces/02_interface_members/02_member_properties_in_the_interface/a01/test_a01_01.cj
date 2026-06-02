/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_02_a01_01

  @Level:         1

  @Assertion: 6.2.2.2(1)
              Properties can also be defined in interface,
              see Chapter 7 for the syntax of defining member properties.

  @Description: Check that interfaces can contain correct properties definitions

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

var set_sink = 0

interface I {
    mut prop p1: Int64 {
        get() {
            10
        }
        set(v) {
            set_sink++
        }
    }

    prop p2: Array<Rune> {
        get() {
            [r'c', r'u', r'f']
        }
    }

    static mut prop p3: Bool {
        get() {
            true
        }
        set(v) {
            set_sink++
        }
    }

    static prop p4: Float64 {
        get() {
            1.17
        }
    }

    // Properties with function definitions, variable declarations and expressions
    mut prop p5: Int64 {
        get() {
            func local(x: Int64) {
                return x *3
            }
            local(5)
        }
        set(v) {
            set_sink++
            var s = p5
            s++
        }
    }

    prop p6: Array<Rune> {
        get() {
            var m = [r'a', r'a', r'a']
            m[1] = r'7'
            m[2] = r'b'
            m
        }
    }

    static mut prop p7: Bool {
        get() {
            let x = 1
            var y = 2
            x > y
        }
        set(v) {
            set_sink++
            var f = { => var x = 0; x++}
            f()
        }
    }

    static prop p8: Float64 {
        get() {
            func local() {}
            let x = local
            x()
            -1.01
        }
    }


    func verify() {
        Assert.equals(10, p1)
        Assert.equals([r'c', r'u', r'f'], p2)
        Assert.equals(true, p3)
        Assert.approxEquals(1.17, p4)
        Assert.equals(15, p5)
        Assert.equals([r'a', r'7', r'b'], p6)
        Assert.equals(false, p7)
        Assert.approxEquals(-1.01, p8)

        p1 = 1
        Assert.equals(1, set_sink)
        p3 = false
        Assert.equals(2, set_sink)
        p5 = 1
        Assert.equals(3, set_sink)
        p7 = false
        Assert.equals(4, set_sink)
    }
}

class A <: I {}

main() {
    A().verify()
}