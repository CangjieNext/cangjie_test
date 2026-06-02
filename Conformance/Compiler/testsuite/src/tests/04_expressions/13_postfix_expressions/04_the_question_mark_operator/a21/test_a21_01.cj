/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a21_01

  @Level:         1

  @Assertion: 4.13.4(21) or a?[b], a?[b] is mutable only if T is a reference type and T overloads the set form of the
              operator [], otherwise a?[b] is immutable.

  @Description: Check that 'a?[b]' is mutable when T is a reference type and T overloads the set form of the
                operator [].

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
    var a: ?Array<Int64> = [1, 2, 3, 4, 5]
    Assert.equals(2, a?[1] ?? 42)
    a?[1] = 9
    Assert.equals(9, a?[1] ?? 42)

    var c: ?C = C()
    Assert.equals(0, c?.x ?? 42)
    c?[0] = 9
    Assert.equals(9, c?.x ?? 42)

    return
}

