/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a10_02

  @Level:         1

  @Assertion: 9.2(10) Constraints of different type parameters need to be separated by “,”.

  @Description: Check that "," absence between constraints for type parameters in generic class declaration
                causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

open class Animal {}

open class Shape {}

class GenericClass<T, U> where T <: Animal U <: Shape {}

main() {}

