/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_01_a05_02

  @Level:         1

  @Assertion: 9.5.1.1(5) In cangjie programming langauge, the concrete type upperbounds of a generic type parameter 
              need to satisfy the following rules:
              1.  They must be one of the above two cases. Its upper bounds are in class-related case or
                  class-irrelative case. 

  @Description: Check that upper bound containing both, class-related and class-irrelative cases, causes a compilation
                error.

  @Mode: compileonly

  @Negative: yes

*/

interface I {}

class GenericClass<T> where T <: I & Int64 {}

main() {}

