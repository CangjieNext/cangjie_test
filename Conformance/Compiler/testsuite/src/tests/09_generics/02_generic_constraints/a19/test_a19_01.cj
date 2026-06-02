/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a19_01

  @Level:         1

  @Assertion: 9.2(19) For example, the following two generics C and D are used. Assume that I1 <: I2 exists. The 
              constraint of C is stricter than that of D. 
              class C<X, Y> where X <: I1, Y <: I1 and class D<X, Y> where X <: I2, Y <: I2

  @Description: Check the example.

  @Mode: compileonly

  @Negative: no

*/

interface I2 {}

interface I1 <: I2 {}

class C<X, Y> where X <: I1, Y <: I1 {}

class D<X, Y> where X <: I2, Y <: I2 {}

main() {}

