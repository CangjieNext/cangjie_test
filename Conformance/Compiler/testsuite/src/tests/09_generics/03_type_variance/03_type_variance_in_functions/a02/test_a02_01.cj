/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_03_03_a02_01

  @Level:         1

  @Assertion: 9.3.3(2) Assume that the type of the f1 function is S1 -> T1 and the type of the f2 function is S2 -> T2.
              f1 is a subtype of f2 if S2 <: S1 and T1 <: T2.

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

func applyToBase(arg: B, fn: (B) -> A): A {
    return fn(arg)
}

func applyToDerived(arg: DerivedB, fn: (DerivedB) -> A): A {
    return fn(arg)
}

func convertBaseToBase(x: B): A {
    return A()
}

func convertBaseToDerived(x: B): DerivedA {
    return DerivedA()
}

func convertDerivedToBase(x: DerivedB): A {
    return A()
}

func convertDerivedToDerived(x: DerivedB): DerivedA {
    return DerivedA()
}

main() {
    // Function type-subtype checking should be triggered here.
    
    // Exact function types matching.
    Assert.isTrue(applyToBase(B(), convertBaseToBase) is A)
    Assert.isTrue(applyToDerived(DerivedB(), convertDerivedToBase) is A)

    // Function return type covariance.
    Assert.isTrue(applyToBase(B(), convertBaseToDerived) is DerivedA)

    // Function parameter type contra-variance.
    Assert.isTrue(applyToDerived(DerivedB(), convertDerivedToDerived) is DerivedA)
}

