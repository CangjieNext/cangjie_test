/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a14_01

  @Level:         1

  @Assertion: 4.13.4(14) Let’s look at another example containing multiple ? for a multi-layer access a?.b.c?.d
              (just take ?.
              as an example, other operators are similar and will not be repeated), it can be found that:

              2. The expression a?.b.c?.d is of type Option<Td>, where Td is the type of the instance member d of Tc.

  @Description: Check that expression 'a?.b.c?.d' type is 'Option<Td>'.

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
    let a2 = Option<A>.None
    Assert.isTrue(a1?.b.c?.d is Option<Int64>)
    Assert.isTrue(a2?.b.c?.d is Option<Int64>)
}

