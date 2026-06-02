/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_01_a08_01

  @Level:         1

  @Assertion: 6.2.3.1(8)
              The default implemention in the child interface
              can no longer access the default implemention in the parent interface.

  @Description: Check that default implemetations in the child interface
                can only access themselves and not the default implementation of the parent interface

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006391

  @Comment: There's either a contradiction in the specification or a bug in the compiler.
            Because parent's default implementation of static members can be accessed through the type name.
            The specification mentions it, so for now treat it as an inconsistency in the specification
            and not a bug in the compiler

*/

import utils.assert.Assert

interface I {
    func f1(x: Bool, y: I) {
        return 0
    }
    static func f2(x: Bool) {
        return 0
    }
    static func f3<T>(x: Bool) {
        return 0
    }

    mut prop p1: Int64 {
        get() {
            0
        }
        set(v) {}
    }
    prop p2: Int64 {
        get() {
            0
        }
    }
    static mut prop p3: Int64 {
        get() {
            0
        }
        set(v) {}
    }
    static prop p4: Int64 {
        get() {
            0
        }
    }
    operator func !(): Int64 {
        return 0
    }
}

var p1_counter = 0
var p2_counter = 0
var p3_counter = 0
var p4_counter = 0
var operator_counter = 0

interface J <: I {
    func f1(x: Bool, y: I): Int64 {
        if (x == true) {
            Assert.equals(1, f1(false, y))
            Assert.equals(1, y.f1(false, y))
        }
        return 1
    }
    static func f2(x: Bool): Int64 {
        if (x == true) {
            Assert.equals(2, f2(false))
        }
        return 2
    }
    static func f3<T>(x: Bool): Int64 {
        if (x == true) {
            Assert.equals(3, f3<T>(false))
        }
        return 3
    }

    mut prop p1: Int64 {
        get() {
            if (p1_counter == 0) {
                p1_counter = 1
                Assert.equals(4, p1)
                let a: I = Impl()
                Assert.equals(4, a.p1)
            }
            4
        }
        set(v) {}
    }
    prop p2: Int64 {
        get() {
            if (p2_counter == 0) {
                p2_counter = 1
                Assert.equals(5, p2)
                let a: I = Impl()
                Assert.equals(5, a.p2)
            }
            5
        }
    }
    static mut prop p3: Int64 {
        get() {
            if (p3_counter == 0) {
                p3_counter = 1
                Assert.equals(6, p3)
            }
            6
        }
        set(v) {}
    }
    static prop p4: Int64 {
        get() {
            if (p4_counter == 0) {
                p4_counter = 1
                Assert.equals(7, p4)
            }
            7
        }
    }
    operator func !(): Int64 {
        if (operator_counter == 0) {
            operator_counter = 1
            Assert.equals(8, !this)
            let x: I = Impl()
            Assert.equals(8, !x)
        }
        return 8
    }
}

class Impl <: J {}

main() {
    let tst = Impl()
    Assert.equals(1, tst.f1(true, tst))
    Assert.equals(2, J.f2(true))
    Assert.equals(3, J.f3<Unit>(true))

    Assert.equals(4, tst.p1)
    Assert.equals(5, tst.p2)
    Assert.equals(6, J.p3)
    Assert.equals(7, J.p4)

    Assert.equals(8, !tst)
}