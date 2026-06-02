/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_03_04_a01_03

  @Level:         1

  @Assertion: 9.3.4(1) A type of tuples may be a subtype of another. That is, if each element of a tuple is of a type 
              that is a subtype of the corresponding element of another tuple, the former is a subtype of the latter.

  @Description: Check tuple subtype for each element being a subtype.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

open class A1 {}
open class A2 {}

open class B1 <: A1 {}
open class B2 <: A2 {}

main() {
    // Type-subtype checking should be triggered for function parameter.
    Assert.isTrue((A1(), A2()) is (A1, A2))
    Assert.isTrue((B1(), A2()) is (A1, A2))
    Assert.isTrue((A1(), B2()) is (A1, A2))
    Assert.isTrue((B1(), B2()) is (A1, A2))
    Assert.isFalse((A1(), A2()) is (B1, A2))
    Assert.isTrue((B1(), A2()) is (B1, A2))
    Assert.isFalse((A1(), B2()) is (B1, A2))
    Assert.isTrue((B1(), B2()) is (B1, A2))
    Assert.isFalse((A1(), A2()) is (A1, B2))
    Assert.isFalse((B1(), A2()) is (A1, B2))
    Assert.isTrue((A1(), B2()) is (A1, B2))
    Assert.isTrue((B1(), B2()) is (A1, B2))
    Assert.isFalse((A1(), A2()) is (B1, B2))
    Assert.isFalse((B1(), A2()) is (B1, B2))
    Assert.isFalse((A1(), B2()) is (B1, B2))
    Assert.isTrue((B1(), B2()) is (B1, B2))
}
