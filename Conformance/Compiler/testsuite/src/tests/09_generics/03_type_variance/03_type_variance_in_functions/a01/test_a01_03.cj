/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_03_03_a01_03

  @Level:         1

  @Assertion: 9.3.3(1) The parameter type of a function is contra-variant, and the return type of a function is 
              covariant.

  @Description: Check that function return type is covariant for a super type.

  @Mode: compileonly

  @Negative: yes

*/

import utils.assert.Assert

open class A {}

open class DerivedA <: A {}

open class B {}

open class DerivedB <: B {}

func applyToDerived(arg: DerivedB, fn: (DerivedB) -> DerivedA): A {
    return fn(arg)
}

func convertDerivedToBase(x: DerivedB): A {
    return A()
}

main() {
    // Function type-subtype checking should be triggered here.
    Assert.isTrue(applyToDerived(DerivedB(), convertDerivedToBase) is A)
}

