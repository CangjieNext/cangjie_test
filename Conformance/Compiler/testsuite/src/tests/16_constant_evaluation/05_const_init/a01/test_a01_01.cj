
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_05_a01_01

  @Level:         1

  @Assertion:   16.5(1) 1.If the current type is class, it cannot have instance member variables declared by var,
                otherwise it is not allowed to define const init. If the current type has a parent class, the current
                const init must call the const init of the parent class (either explicitly or implicitly without a
                const init), or error if the parent class does not have a const init.
  @Description: Check scenarios when both parent and child class have const init.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert
    
open class A {
    static const a1 = 1
    let a2: Int64

    const init() {
        a2 = 2
    }
}

class B <: A {
    static const b1 = 3
    let b2: Int64

    const init() {
        b2 = 4
    }
}

class C <: A {
    static const c1 = 5
    let c2: Int64

    const init() {
        super()
        c2 = 6
    }
}

open class D {
    static const d1 = 7
    let d2: Int64

    const init() {
        d2 = 8
    }

    init(x: Int64) {
        d2 = 9
    }
}

class E <: D {
    static const e1 = 10
    let e2: Int64

    const init() {
        super()
        e2 = 11
    }
}

main() {
    const b = B()
    const c = C()
    const e = E()

    Assert.equals(1, B.a1)
    Assert.equals(2, b.a2)
    Assert.equals(1, C.a1)
    Assert.equals(2, c.a2)
    Assert.equals(3, B.b1)
    Assert.equals(4, b.b2)
    Assert.equals(5, C.c1)
    Assert.equals(6, c.c2)
    Assert.equals(7, D.d1)
    Assert.equals(8, e.d2)
    Assert.equals(10, E.e1)
    Assert.equals(11, e.e2)
}
