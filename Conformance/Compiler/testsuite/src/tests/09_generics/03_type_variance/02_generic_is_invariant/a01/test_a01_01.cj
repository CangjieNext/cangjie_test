/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_03_02_a01_01

  @Level:         1

  @Assertion: 9.3.2(1) In Cangjie programming language, all generics are invariant.

  @Description: Check that generics are invariant.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

open class A {}

open class B {}

class DerivedA <: A {}

class GenericClass<T> {}

type GenericClassA = GenericClass<A>
type GenericClassB = GenericClass<B>
type GenericClassDerivedA = GenericClass<DerivedA>

main() {
    var a = GenericClassA()

    Assert.isTrue(a is GenericClassA)
    Assert.isFalse(a is GenericClassB)
    Assert.isFalse(a is GenericClassDerivedA)
}

