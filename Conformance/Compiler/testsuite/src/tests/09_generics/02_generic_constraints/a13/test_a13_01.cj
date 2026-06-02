/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a13_01

  @Level:         1

  @Assertion: 9.2(13) The constraints of type variables X and Y are the same, which means that all types that meet 
              the X constraints meet Y constraints, and all types that meet the Y constraints also meet the X 
              constraint; 

  @Description: Check the same constraints on single upper bound.

  @Mode: run

  @Negative: no

*/

// For testing constraint definition use restrictions on overriding and overloading of interface functions.
//
// CHAPTER 6. CLASS AND INTERFACE
//
// 6.2.4 Implementation of Interfaces
//
// 6.2.4.1 Overriding and Overloading When a Class Implements Interfaces
//
// 5. If there is any generic function in the interface, the constraints of the type parameters of the implemented
//    function must be looser than or the same as the corresponding function in the interface.

import utils.assert.Assert

open class A {}

open class B <: A {}

open class C <: B {}

interface I {
    static func id<T>(x: T): T where T <: B
}

class Implementation <: I {
    // Same constraint.
    public static func id<T>(x: T): T where T <: B {
        return x
    }
}

main() {
    Assert.isFalse(Implementation.id<B>(B()) is C)
    Assert.isTrue(Implementation.id<C>(C()) is C)
}

