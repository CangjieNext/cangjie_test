/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_05_a01_01

  @Level:         1

  @Assertion: 6.2.5(1)
              The Any interface is a language built-in empty interface,
              which is by default inherited by all interface types and
              implemented by all non-interface types,
              so all types can be used as subtypes of the Any type.

  @Description: Check that Any is an interface that does not have any unimplemented members

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

// A class can implement Any and does not need to define any members
class C <: Any {}

// A struct can implement Any and does not need to define any members
struct S <: Any {}

// An enum can implement Any and does not need to define any members
enum E <: Any {
    EE
}

// An interface can inherit Any
interface I <: Any {}

class AnyConstraint<T> where T <: Any {}

main() {
    let c = C()
    Assert.isTrue(c is Any)

    let s = S()
    Assert.isTrue(s is Any)

    let e = E.EE
    Assert.isTrue(e is Any)

    let i = AnyConstraint<I>()
    Assert.isTrue(i is AnyConstraint<I>)
}