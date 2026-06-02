/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a11_02

  @Level:         1

  @Assertion: 4.13.4(11) Using the expressions a?.b, c?(d) and e?[f] as examples.

              3. When the values of a, c and e are equal to Some(v1), Some(v2) and Some(v3) respectively, the values of
                 a?.b, c?(d) and e?[f] are equal to Option<U1>.Some(v1.b), Option<U2>.Some(v2(d)) and
                 Option<U3>.Some(v3[f]) respectively. When the values of a, c and e are equal to None respectively, the
                 values of a?.b, c?(d) and e?[f] are equal to Option<U1>.None, Option<U2>.None and Option<U3>.None
                 respectively (note that here b, d and f will not be evaluated).

  @Description: Check that 'b', 'd' and 'f' will not be evaluated if 'a', 'c' and 'e' are None.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

var counter = 0

struct S {
    func incrementCounter() {
        counter += 1
    }
}

func incrementCounter(): Int64 {
    counter += 1
    return counter
}

main() {
    // Case: 'a?.b'
    //
    // Well, seems like there is no honest way to check that instance member access is not evaluated for None value
    // in chaining optional expression, because instance member access does not have side effects.
    var s = Option<S>.None
    s?.incrementCounter()

    // Case: 'c?(d)'
    var f = Option<(Int64) -> Unit>.None
    f?(incrementCounter())

    // Case: 'e?[f]'
    var a = Option<Array<Int64>>.None
    a?[incrementCounter()]

    Assert.equals(0, counter)
}

