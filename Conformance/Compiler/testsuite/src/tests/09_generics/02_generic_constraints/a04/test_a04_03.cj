/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a04_03

  @Level:         1

  @Assertion: 9.2(4) LHS of <: is called lower bound of the constraint. Lower bound of a generic contraint can only be 
              type variable.

  @Description: Check that lower bound in generic interface declaration being an another type causes a compilation
                error.

  @Mode: compileonly

  @Negative: yes

*/

open class Animal {}

class Dog <: Animal {}

interface GenericInterface<T> where Dog <: Animal {
    func isAnimal(x: T) {
        return x is Animal
    }
}

main() {
}

