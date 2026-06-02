/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a04_02

  @Level:         1

  @Assertion: 9.2(4) LHS of <: is called lower bound of the constraint. Lower bound of a generic contraint can only be 
              type variable.

  @Description: Check that lower bound in generic class declaration being an another type causes a compilation
                error.

  @Mode: compileonly

  @Negative: yes

*/

open class Animal {}

class Dog <: Animal {}

class GenericClass<T> where Dog <: Animal {

    init(arg: T) {
        x = arg
    }

    func get() {
        return x
    }

    var x: T
}

main() {
}

