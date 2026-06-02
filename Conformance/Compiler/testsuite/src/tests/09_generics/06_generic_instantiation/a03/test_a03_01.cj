/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_06_a03_01

  @Level:         1

  @Assertion: 9.6(3) In fact, once a generic function or type is instantiated, the non-generic function or type is 
              used.

  @Description: Check that instantiated generic function or type might be used as non-generic function or type.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

struct S<T> {
    S(var x!: T) {}
}

func fun<T>(x: T): T {
    return x
}

main() {
    // s.x of correct type means that S<Int32> should be properly instantiated during compilation.
    let s = S<Int32>(x: 42)
    Assert.isTrue(s.x is Int32)

    // Correct generic function call means that generic function should be properly instantiated during compilation.
    let r = fun<Int64>(42)
    Assert.equals(42, r)
}

