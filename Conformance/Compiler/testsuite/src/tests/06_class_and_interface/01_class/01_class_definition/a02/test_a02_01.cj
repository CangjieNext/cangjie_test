/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a02_01

  @Level:         1

  @Assertion: 6.1.1(2)
              A class definition consists of the following parts.
              - optional modifiers
              - the class keyword
              - class name
              - optional type parameters
              - optional superclass or a list of super interfaces (listed after <:, and seperated by &). Superclass should be listed at the beginging if there is one.
              - optional generic constraints using keyword where
              - class body

  @Description: Check that a class definition can contain all the listed parts

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

public open class SClass {}

public interface I1 {}

public interface I2 {}

public class Cond1 <: I1 {}

public class Cond2 <: I2 {}

public abstract class FullHouse<G1, G2, G3> <: SClass & I1 & I2 where G1 <: I1 , G2 <: I2 {
  public func foo() : FullHouse<G1, G2, G3>
  public func bar() : Int32
}

class TestClass<G1, G2, G3> <: FullHouse<G1, G2, G3> where G1 <: I1 , G2 <: I2 {
  public func foo() {
    return this
  }
  public func bar() : Int32 {
    return 0
  }
}

main() {
  let tst = TestClass<Cond1, Cond2, Int32>()
  Assert.isTrue(tst is FullHouse<Cond1, Cond2, Int32>)
}
