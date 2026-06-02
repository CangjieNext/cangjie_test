/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a01_02

  @Level:         1

  @Assertion: 9.2(1) In Cangjie programming language, <: can be used to denote one type is a subtype of another type. 

  @Description: Check that substitution of non-subtype type to a generic class causes a compiler error.

  @Mode: compileonly

  @Negative: yes

*/

open class Animal {}

class Dog <: Animal {}

class Car {}

class GenericClass<T> where T <: Animal {

    init(arg: T) {
        x = arg
    }

    func isDog() {
        return x is Dog
    }

    var x: T
}

main() {
    var c = Car()

    if (GenericClass<Car>(c).isDog()) {
        return 1
    }
    return 0
}

