/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a02_04

  @Level:         1

  @Assertion: 9.2(2) <: is a binary relation. By using this relation operator, constraints can be imposed to type 
              parameters so that the type parameters can only be substituted with only certain types that satisfies 
              the relation.

  @Description: Check that substitution into generic struct by a not satisfying type causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

open class Base {}

open class Animal <: Base {}

class Dog <: Animal {}

class GenericStruct<T> where T <: Animal {
    GenericStruct(var x!: T) {}
}

type T = Base

main() {
    var c = T()

    if (GenericStruct<T>(x: c).x is T) {
        return 1
    }
    return 0
}

