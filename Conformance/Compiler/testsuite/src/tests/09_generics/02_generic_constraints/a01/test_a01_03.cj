/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a01_03

  @Level:         1

  @Assertion: 9.2(1) In Cangjie programming language, <: can be used to denote one type is a subtype of another type. 

  @Description: Check that substitution of non-subtype type to a generic function causes a compiler error.

  @Mode: compileonly

  @Negative: yes

*/

open class Animal {}

class Dog <: Animal {}

class Car {}

func genericFunction<T>(x: T) where T <: Animal {
    if (x is Dog) {
        return 1
    }
    return 0
}

type T = Car

main() {
    var c = T()

    return genericFunction<T>(c)
}

