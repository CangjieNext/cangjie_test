/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a14_01

  @Level:         1

  @Assertion: 9.2(14) The constraints of the type variable X is stricter than that of Y, which means that all types 
              that meet the X constraint check meet the constraint check of Y; otherwise, the constraint may not be 
              met; 

  @Description: Check stricter constraint usage in interface then in class.

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

interface Printable {}

interface Runnable {}

class C <: Printable & Runnable {}

interface I {
    // Stricter constraint than implementation. OK.
    static func id<T>(x: T): T where T <: Printable & Runnable
}

class Implementation <: I {
    public static func id<T>(x: T): T where T <: Printable {
        return x
    }
}

main() {
    Assert.isTrue(Implementation.id<C>(C()) is C)
}

