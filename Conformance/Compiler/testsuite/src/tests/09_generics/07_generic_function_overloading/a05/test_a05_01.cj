/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_07_a05_01

  @Level:         1

  @Assertion: 9.7(5) The call expression is in the form C<TA>.f(A), that is, f is a static member function of a 
              generic type.
              The type is instantiated first. Then, the instantiated static member function enters the candidate set
              if it is type checked. If the type parameters of C is X, the function f that enters the candidate set is
              to replace X with TA in f:
                  𝜎 = [𝑋 ↦ 𝑇 𝐴]𝑓 ′ = 𝜎𝑓 

  @Description: Check the generic static member function of a generic type instantiation.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

open class A {}
open class B {}

class C<TA> {
    static func f(x: A) {
        return 1
    }

    static func f(x: B) {
        return 2
    }
}

main() {
    Assert.equals(1, C<A>.f(A()))
    Assert.equals(2, C<A>.f(B()))
}

