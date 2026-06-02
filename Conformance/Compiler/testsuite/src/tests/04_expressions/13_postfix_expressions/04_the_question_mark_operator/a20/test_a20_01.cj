/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a20_01

  @Level:         1

  @Assertion: 4.13.4(20) Moreover, we have the following rules. For a?.b, a?.b is mutable only if T is
              a reference type and b mutable, otherwise a?.b is immutable.

  @Description: Check that 'a?.b' is mutable when T (type of 'a') is a reference type and 'b' is mutable.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class A {
    init() {
        b = 0
    }

    var b: Int64
}

main() {
    var a: ?A = A()
    Assert.equals(0, a?.b ?? 42)
    a?.b = 9  // Should be mutated.
    Assert.equals(9, a?.b ?? 42)
}

