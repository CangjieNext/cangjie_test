/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:02_01_10_02_a39_02

  @Level:         1

  @Assertion: 2.1.10.2(39)
              It is not allowed to invoke a constructor via this outside of the constructor body.

  @Description: Check that constuctors can be invoked on another instance anywhere inside the struct

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124, 0006136

*/

import utils.assert.Assert

var gv = 0

struct A {
    init() {
        let x = A(1)
    }

    init(x: Int64) {
        gv = x
    }

    func f1() {
        let x = A(2)
    }

    mut prop p1: Int64 {
        get() {
            let x = A(3)
            1
        }
        set(v) {
            let x = A(4)
        }
    }

    static func f2() {
        let x = A(5)
    }

    static mut prop p2: Int64 {
        get() {
            let x = A(6)
            1
        }
        set(v) {
            let x = A(7)
        }
    }

    static init() {
        let x = A(-1)
    }
}

main() {
    // Static init is called automatically during package loading
    Assert.equals(-1, gv)

    // A constructor can create another instance
    var a = A()
    Assert.equals(1, gv)

    // A member function can create another instance
    a.f1()
    Assert.equals(2, gv)

    // A member property getter can create another instance
    a.p1
    Assert.equals(3, gv)

    // A member property setter can create another instance
    a.p1 = 3
    Assert.equals(4, gv)

    // A static function can create another instance
    A.f2()
    Assert.equals(5, gv)

    // A static property getter can create another instance
    A.p2
    Assert.equals(6, gv)

    // A static property setter can create another instance
    A.p2 = 3
    Assert.equals(7, gv)
}