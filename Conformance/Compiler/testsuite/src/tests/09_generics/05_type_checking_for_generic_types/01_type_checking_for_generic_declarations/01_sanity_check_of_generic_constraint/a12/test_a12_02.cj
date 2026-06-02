/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_01_a12_02

  @Level:         1

  @Assertion: 9.5.1.1(12) In cangjie programming langauge, the concrete type upperbounds of a generic type parameter 
              need to satisfy the following rules:
                  4. When upper bounds are class-irrelative types, the constraint cannot be a recursive constraint. A
                   Recursive generic constraint is a constraint with the type arguments of its upper bound depending on
                   the type variable of the lower bound directly or indirectly.

  @Description: Check that recursive constraint on enum upper bound causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

enum  E<T> {
    | Data(T)
    | Code(Int64)
}

class GenericClass<T> where T <: E<T> {}

main() {}

