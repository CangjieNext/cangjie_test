/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_01_a14_01

  @Level:         1

  @Assertion: 9.5.1.1(14) T <: U, U <: (Int32) -> T is also illegal since function is a primitive type and it conform 
              a recursive constraint via type parameter U

  @Description: Check that T <: U, U <: (Int32) -> T causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

class C<T, U> where T <: U, U <: (Int32) -> T {}

main() {}

