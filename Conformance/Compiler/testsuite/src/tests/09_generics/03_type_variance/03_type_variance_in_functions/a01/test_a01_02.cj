/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_03_03_a01_02

  @Level:         1

  @Assertion: 9.3.3(1) The parameter type of a function is contra-variant, and the return type of a function is 
              covariant.

  @Description: Check that function parameter type is contra-variant for a sub type.

  @Mode: compileonly

  @Negative: yes

*/

import utils.assert.Assert

open class A {}

open class DerivedA <: A {}

open class B {}

open class DerivedB <: B {}

func applyToBase(arg: B, fn: (B) -> A): A {
    return fn(arg)
}

func convertDerivedToBase(x: DerivedB): A {
    return A()
}

main() {
    Assert.isTrue(applyToBase(B(), convertDerivedToBase) is A)
}

