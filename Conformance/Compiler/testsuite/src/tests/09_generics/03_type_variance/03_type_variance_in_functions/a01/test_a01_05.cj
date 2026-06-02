/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_03_03_a01_05

  @Level:         1

  @Assertion: 9.3.3(1) The parameter type of a function is contra-variant, and the return type of a function is 
              covariant.

  @Description: Check that function parameter type is contra-variant for a super type. Also check that function
                return type is covariant for a subtype.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

open class A1 {}
open class A2 <: A1 {}
open class A3 <: A2 {}

func assert<T>(input:T) {
    return input
}

main() {
    // Function type-subtype checking should be triggered here.
    Assert.isTrue(assert<(A2) -> A2>({a: A2 => a}) is (A2) -> A2)
    Assert.isTrue(assert<(A2) -> A2>({a: A2 => a}) is (A3) -> A1)
    Assert.isTrue(assert<(A2) -> A2>({a: A1 => A3()}) is (A2) -> A2)
    Assert.isTrue(assert<(A2) -> A2>({a: A1 => A3()}) is (A3) -> A1)
    Assert.isTrue(assert<(A2) -> A2>({a: A1 => A3()}) is (A1) -> A2)
}
