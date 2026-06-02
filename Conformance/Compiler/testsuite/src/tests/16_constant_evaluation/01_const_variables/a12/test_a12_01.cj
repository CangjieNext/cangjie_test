
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a12_01

  @Level:         1

  @Assertion:   16.1(12) const variables can access all instance members of the corresponding type, and can also call
                all non-mut instance member functions of the corresponding type.
  @Description: Checks that const variables can access all instance members of the corresponding type, and can also
                call all non-mut instance member functions of the corresponding type for various types.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

abstract class A {
    let a = "a"
    const init() {}
}

class C <: A {
    static const c = "c"
    static const v = "v"
    let l = "l"

    const init() {}

    func f() { "f" }
    const func cf() { "cf" }
    operator func -() { "-" }
}

interface I {
    func iff() { "iff" }
}

struct S <: I {
    static const c = "c"
    var v = "v"
    let l = "l"

    const init() { }

    func f() { "f" }
    const func cf() { "cf" }
    operator func -() { "-" }
}

enum E {
    E0

    func f() { "f" }
    const func cf() { "cf" }
    operator func -() { "-" }
}

main() {
    const c = C()
    Assert.equals("c", C.c)
    Assert.equals("v", C.v)
    Assert.equals("l", c.l)
    Assert.equals("f", c.f())
    Assert.equals("cf", c.cf())
    Assert.equals("-", -c)
    Assert.equals("a", c.a)

    const s = S()
    Assert.equals("c", S.c)
    Assert.equals("v", s.v)
    Assert.equals("l", s.l)
    Assert.equals("f", s.f())
    Assert.equals("cf", s.cf())
    Assert.equals("-", -s)
    Assert.equals("iff", s.iff())

    const e = E.E0
    Assert.equals("f", e.f())
    Assert.equals("cf", e.cf())
    Assert.equals("-", -e)
}
