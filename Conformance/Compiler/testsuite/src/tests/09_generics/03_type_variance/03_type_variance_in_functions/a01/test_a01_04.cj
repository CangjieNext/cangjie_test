/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_03_03_a01_04

  @Level:         1

  @Assertion: 9.3.3(1) The parameter type of a function is contra-variant, and the return type of a function is 
              covariant.

  @Description: Check that function parameter type is contra-variant for a super type. Also check that function
                return type is covariant for a subtype.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

open class A {}

open class DerivedA <: A {}

open class B {}

open class DerivedB <: B {}

func f1(a: B): A {
    A()
}

func f2(a: B): DerivedA {
    DerivedA()
}

func f3(a: DerivedB): A {
    A()
}

func f4(a: DerivedB): DerivedA {
    DerivedA()
}

main() {
    // Function type-subtype checking should be triggered here.
    Assert.isTrue(f1 is (B) -> A)
    Assert.isTrue(f2 is (B) -> A)
    Assert.isFalse(f3 is (B) -> A)
    Assert.isFalse(f4 is (B) -> A)
    Assert.isTrue(f1 is (DerivedB) -> A)
    Assert.isTrue(f2 is (DerivedB) -> A)
    Assert.isTrue(f3 is (DerivedB) -> A)
    Assert.isTrue(f4 is (DerivedB) -> A)
    Assert.isFalse(f1 is (B) -> DerivedA)
    Assert.isTrue(f2 is (B) -> DerivedA)
    Assert.isFalse(f3 is (B) -> DerivedA)
    Assert.isFalse(f4 is (B) -> DerivedA)
    Assert.isFalse(f1 is (DerivedB) -> DerivedA)
    Assert.isTrue(f2 is (DerivedB) -> DerivedA)
    Assert.isFalse(f3 is (DerivedB) -> DerivedA)
    Assert.isTrue(f4 is (DerivedB) -> DerivedA)
}

