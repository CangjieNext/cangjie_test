/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_07_a04_01

  @Level:         1

  @Assertion: 9.7(4) When building a candidate set for function calls, pay attention to the following points for 
              generic functions:

              1. When a function is called, the generic function f may be a partially instantiated generic function
                 or a fully instantiated function that enters the candidate set. The form of a candidate function is
                 determined by the form of the calling expression.

  @Description: Check the partially instantiated generic functions overload resolution.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C<T> {
    // Function foo is partially instantiated after T type is known on C<T> instantiation.
    func foo<T, U>(x: T, u: U) {
        return 1
    }

    func foo(x: Int64, y: Int64) {
        return 2
    }
}

class A {}

main() {
    let c = C<A>()
    Assert.equals(1, c.foo(A(), "hello"))
    Assert.equals(2, c.foo(42, 42))
}

