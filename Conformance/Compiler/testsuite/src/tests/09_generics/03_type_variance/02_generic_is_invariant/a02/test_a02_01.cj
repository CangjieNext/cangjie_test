/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_03_02_a02_01

  @Level:         1

  @Assertion: 9.3.2(2) For instance, if A is a subtype of B, ClassName<A> is not a subtype of ClassName<B>. 
              We forbid this behavior to ensure runtime safety.

  @Description: Check that ClassName<A> is not a subtype of ClassName<B>, if A is a subtype of B.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

open class A {}

class DerivedA <: A {}

class GenericClass<T> {}

type GenericClassA = GenericClass<A>
type GenericClassDerivedA = GenericClass<DerivedA>

main() {
    var a = GenericClassA()

    Assert.isTrue(a is GenericClassA)
    Assert.isFalse(a is GenericClassDerivedA)
}

