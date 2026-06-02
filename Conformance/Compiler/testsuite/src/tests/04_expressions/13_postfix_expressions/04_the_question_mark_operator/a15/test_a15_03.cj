/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a15_03

  @Level:         1

  @Assertion: 4.13.4(15) Let’s look at another example containing multiple ? for a multi-layer access a?.b.c?.d
              (just take ?.
              as an example, other operators are similar and will not be repeated), it can be found that:

              3. When the value of a is equal to Some(va) and the value of va.b.c is equal to Some(vc), the value of
                 a?.b.c?.d is equal to Option<Td>.Some(vc.d). When the value of a is equal to Some(va) and the value
                 of va.b.c is equal to None, the value of a?.b.c? d is equal to Option<Td>.None (d will not be
                 evaluated). When the value of a is equal to None, the value of a?.b.c?.d is equal to Option<Td>.None
                 (neither b, c nor d will be evaluated).

  @Description: Check that value of 'a?.b.c?.d' is equal to 'Option<Td>.None' when the value of 'a' is equal to 'None'.
                Also checks that neither b, c or d will be evaluated.

  @Mode: run

  @Negative: no

*/

// NOTE: There is no way to check that instance member access will not be evaluated, because instance member access
//       does not have side effects. Check the claim through usage of instance member which is less strict.

import utils.assert.Assert

var counter = 0

struct C {
    var d = 5

    func incrementCounterGetD() {
        counter += 1
        return d
    }
}

struct B {
    var c = Option<C>.Some(C())
}

struct A {
    var b = B()

    func incrementCounterGetB() {
        counter += 1
        return b
    }
}

main() {
    let a = Option<A>.None
    let x = a?.b.c?.d
    Assert.isTrue(x is Option<Int64>)
    Assert.isNone(x)

    a?.incrementCounterGetB().c?.incrementCounterGetD()
    Assert.equals(0, counter)
}

