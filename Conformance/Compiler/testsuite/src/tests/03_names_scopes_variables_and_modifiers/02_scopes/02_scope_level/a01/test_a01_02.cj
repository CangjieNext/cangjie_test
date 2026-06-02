/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            03_02_02_a01_02

  @Level:         1
  @Assertion:       3.2.2(1) The scope of a name is the part of the program where the name can be used to refer to the
                    entity, without any qualifier, provided that the name is not shadowed.

  @Description:     Check that we can refer to the entity without qualifiers.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert
import utils.macros.*

func f() { 9 }

class A {
    func f() { 7 }
    func g() {
        f() // the same as with the `this` qualifier: `this.f()`
    }
}

enum B { A(Int64) | C }

main() {
    let a = A()
    Assert.equals(7, a.f())
    Assert.equals(9, f())

    let enumA = B.A(1) // the same as `B.f(1)`
    match(enumA) {
        case B.A(x) => Assert.equals(1, x)
        case _ => Assert.isTrue(false)
    }
    let b = C // the same as `B.C`
    @matchOrThrow[B.C](b)

    let f = { => 13 }
    Assert.equals(7, a.f())
    Assert.equals(13, f())
}
