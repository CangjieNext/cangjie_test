/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_03_03_a02_02

  @Level:         1

  @Assertion: 9.3.3(2) Assume that the type of the f1 function is S1 -> T1 and the type of the f2 function is S2 -> T2.
              f1 is a subtype of f2 if S2 <: S1 and T1 <: T2.

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

