/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_01_a07_01

  @Level:         1

  @Assertion:     5.1.2.1(7)
      open class A { 
         public open func f(a!: Int32): Int32 { 
              return a + 1 
         } 
      } 

      class B <: A { 
         public override func f(a!: Int32): Int32 { // ok 
              return a + 1 
         } 
      } 

      class C <: A { 
         public override func f(b!: Int32): Int32 { // error 
              return b + 1 
         } 
      } 
 

  @Description:   Positive example from spec.

  @Mode:          run

  @Negative:      no

  @Structure:     single

  @Issue:         6178

*/
import utils.assert.Assert

open class A { 
  public open func f(a!: Int32): Int32 { 
    return a + 1 
  } 
} 

class B <: A { 
  public override func f(a!: Int32): Int32 { // ok 
    return a + 1 
  } 
} 

main() {
  let myA = A()
  Assert.equals(13, myA.f(a: 12))
  let myB = B()
  Assert.equals(2, myB.f(a: 1))
}
