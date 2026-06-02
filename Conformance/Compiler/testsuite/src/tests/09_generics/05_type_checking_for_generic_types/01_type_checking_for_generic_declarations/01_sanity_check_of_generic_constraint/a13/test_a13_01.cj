/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_01_a13_01

  @Level:         1

  @Assertion: 9.5.1.1(13) For example, since Option type is defined by enum declaration, T <: Option<T> is illegal.

  @Description: Check that T <: Option<T> causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

class GenericClass<T> where T <: Option<T> {}

main() {}

