/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_01_a07_02

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

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

  @Issue:         6178

*/

open class A { 
  public open func f(a!: Int32): Int32 { 
    return a + 1 
  } 
} 

class C <: A { 
  public override func f(b!: Int32): Int32 { // error 
    return b + 1 
  } 
} 

main() {
}
