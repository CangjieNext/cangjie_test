/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_03_02_a03_01

  @Level:         1

  @Assertion:     5.3.2(3)
                  open class Base {} 
                  class Sub <: Base {} 
                  func f<X, Y>(a: X, b: Y) {}          // f1 
                  func f<X>(a: Base, b: X) {}          // f2 
                  f<Base>(Base(), Sub()) // f2 may pass the type checking

  @Description:   Positive example from spec

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/

open class Base {} 
class Sub <: Base {} 
func f<X, Y>(a: X, b: Y) {}          // f1 
func f<X>(a: Base, b: X) {}          // f2 

main() {
  f<Base>(Base(), Sub()) // f2 may pass the type checking
}
