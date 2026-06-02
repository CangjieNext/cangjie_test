/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_01_a01_02

  @Level:         1

  @Assertion: 9.5.1.1(1) For each of type parameter in a generic declaration, its upper bounds can be types.

  @Description: Check that literal upper bound causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

class GenericClass<T> where T <: 42 {}

main() {}

