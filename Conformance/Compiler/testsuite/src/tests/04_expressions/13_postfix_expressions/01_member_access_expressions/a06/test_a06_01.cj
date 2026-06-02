/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a06_01

  @Level:         1

  @Assertion: 4.13.1(6) If T is a class name, interface name, or struct name, allow access
              to its static members directly by type name.

  @Description: Check usage of 'T.a' expression where 'T' is a name of class / struct / interface and 'a' is a static
                member.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    static func foo() {
        return 1
    }

    static var x = 2
}

struct S {
    static func foo() {
        return 3
    }

    static var x = 4
}

interface I {
    static func foo() {
        return 5
    }
}

main() {
    // Class.
    let cx = C.x
    Assert.equals(2, cx)
    let cf = C.foo
    Assert.equals(1, cf())

    // Struct.
    let sx = S.x
    Assert.equals(4, sx)
    let sf = S.foo
    Assert.equals(3, sf())

    // Interface.
    let f = I.foo
    Assert.equals(5, f())
}

