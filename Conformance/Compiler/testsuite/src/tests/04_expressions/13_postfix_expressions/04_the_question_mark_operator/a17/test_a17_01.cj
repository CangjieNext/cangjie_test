/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a17_01

  @Level:         1

  @Assertion: 4.13.4(17) Optional chaining expressions can also be used as left value expressions
              (see Assignment Expressions), as in a?.b = e1, a?[b] = e2, and a?.b.c?.d = e3 etc.

  @Description: Check usage of optional chaining expressions as left value expressions.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    init() {
        d = 0
    }

    var d: Int64
}

class B {
    init() {
        value = 0
        c = C()
    }

    var value: Int64
    var c: ?C
}

class A {
    init() {
        value = 0
        b = B()
    }

    var value: Int64
    var b: B
}

main() {
    var a = Option<A>.Some(A())
    var n = Option<A>.None

    //
    // Case: 'a?.b = e1'
    //
    Assert.isTrue(a?.value == 0)
    a?.value = 5
    Assert.isTrue(a?.value == 5)

    Assert.isNone(n?.value)
    n?.value = 5
    Assert.isNone(n?.value)

    //
    // Case: 'a?[b] = e2'
    //
    var arr: ?Array<Int64> = [1, 2, 3, 4, 5]
    var nrr = Option<Array<Int64>>.None

    Assert.isTrue(arr?[2] == 3)
    arr?[2] = 9
    Assert.isTrue(arr?[2] == 9)

    Assert.isNone(nrr?[2])
    nrr?[2] = 9
    Assert.isNone(nrr?[2])

    //
    // Case: 'a?.b.c?.d = e3'
    //
    Assert.isTrue(a?.b.c?.d == 0)
    a?.b.c?.d = 9
    Assert.isTrue(a?.b.c?.d == 9)

    a?.b.c = Option<C>.None
    Assert.isNone(a?.b.c?.d)
    a?.b.c?.d = 9
    Assert.isNone(a?.b.c?.d)
}

