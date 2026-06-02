/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a22_01

  @Level:         1

  @Assertion: 4.13.4(22) When a?.b (or a?[b]) is mutable, assign the value of c to v.b (or to v[b])
              if the value of a is
              Option<T>.Some(v), and do nothing (b and c will not be evaluated) if the value of a is Option<T>.None.

  @Description: Check that assignment to a mutable Some value changes it and assignment to a mutable None value leaves
                None unchanged.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    init() {
        x = 0
    }

    operator func[](i: Int64, value!: Int64) {
        x = value
    }

    var x: Int64
}

main() {
    //
    // Case: 'a?.b'
    //
    var p: ?C = C()
    Assert.isTrue(p?.x == 0)
    p?.x = 9
    Assert.isTrue(p?.x == 9)

    var q = Option<C>.None
    Assert.isNone(q)
    q?.x = 9
    Assert.isNone(q)

    //
    // Case: 'a?[b]'
    //

    var a: ?Array<Int64> = [1, 2, 3, 4, 5]
    Assert.isTrue(a?[1] == 2)
    a?[1] = 9
    Assert.isTrue(a?[1] == 9)

    var b = Option<Array<Int64>>.None
    Assert.isNone(b)
    b?[1] = 9
    Assert.isNone(b)

    var c: ?C = C()
    Assert.isTrue(c?.x == 0)
    c?[0] = 9
    Assert.isTrue(c?.x == 9)

    var d = Option<C>.None
    Assert.isNone(d)
    d?.x = 9
    Assert.isNone(d)

    return
}

