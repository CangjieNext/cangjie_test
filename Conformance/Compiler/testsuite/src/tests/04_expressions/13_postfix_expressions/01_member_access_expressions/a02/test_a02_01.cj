/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a02_01

  @Level:         1

  @Assertion: 4.13.1(2) A member access expression can be used to access the members of a class,
              interface, struct, etc.

  @Description: Check usage of member access expression to access the members of a class, interface, struct and enum.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

interface I {
    func foo() {
        return 4
    }
}

class Impl <: I {}

class C {
    init() {
        x = 2
    }

    func foo() {
        return 5
    }

    var x: Int64
}

struct S {
    S(var x!: Int64) {}

    func foo() {
        return 6
    }
}

enum E {
    | Data(String)
    | Code(Int64)

    func foo() {
        return 8
    }
}

func testI(i: I) {
    // Interface.
    let f = i.foo
    Assert.equals(4, f())
}

main() {
    // NOTE: identifier expression is an atomic expression, which is a postfix expression. Usage of
    //       "identifier '.' identifier" pattern here is ok.

    // Class.
    let c = C()
    let cx = c.x
    Assert.equals(2, cx)
    let cf = c.foo
    Assert.equals(5, cf())

    // Interface.
    testI(Impl())

    // Struct.
    let s = S(x: 3)
    let sx = s.x
    Assert.equals(3, sx)
    let sf = s.foo
    Assert.equals(6, sf())

    // Enum.
    let e = E.Data("hello world")
    let ef = e.foo
    Assert.equals(8, ef())
}

