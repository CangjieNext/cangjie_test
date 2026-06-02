/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a04_04

  @Level:         1

  @Assertion: 9.2(4) LHS of <: is called lower bound of the constraint. Lower bound of a generic contraint can only be 
              type variable.

  @Description: Check that lower bound in generic struct declaration being an another type causes a compilation
                error.

  @Mode: compileonly

  @Negative: yes

*/

open class Animal {}

class Dog <: Animal {}

struct GenericStruct<T> where Dog <: Animal {
    GenericStruct(var x!: T) {}
}

main() {
}

