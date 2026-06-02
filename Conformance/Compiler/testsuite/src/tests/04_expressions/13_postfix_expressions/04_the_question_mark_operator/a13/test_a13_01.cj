/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a13_01

  @Level:         1

  @Assertion: 4.13.4(13) Let’s look at another example containing multiple ? for a multi-layer access a?.b.c?.d
              (just take ?.
              as an example, other operators are similar and will not be repeated), it can be found that:

              1. The type of the expression a needs to be some Option<Ta> and Ta contains the instance member b. The
                 type of b contains the instance member variable c and the type of c is some Option<Tc> and Tc
                 contains the instance member d.

  @Description: Check the 'a?.b.c?.d' example expression usage in the case of satisfied requirements.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

struct C {
    var d = 5
}

struct B {
    var c = Option<C>.Some(C())
}

struct A {
    var b = B()
}

main() {
    let a1 = Option<A>.Some(A())
    let x1 = a1?.b.c?.d ?? 1949
    Assert.equals(5, x1)

    let a2 = Option<A>.None
    let x2 = a2?.b.c?.d ?? 1949
    Assert.equals(1949, x2)
}

