/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_01_a09_02

  @Level:         1

  @Assertion: 9.5.1.1(9) In cangjie programming langauge, the concrete type upperbounds of a generic type parameter 
              need to satisfy the following rules:
                 3. When upper bounds are in the case of class-irrelated types, they can be only one kind of
                    class-irrelated concrete type.

  @Description: Check that two different concrete types causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

class GenericClass<T> where T <: Int64 & Float32 {}

main() {}

