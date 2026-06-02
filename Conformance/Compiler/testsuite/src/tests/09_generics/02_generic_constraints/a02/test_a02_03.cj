/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a02_03

  @Level:         1

  @Assertion: 9.2(2) <: is a binary relation. By using this relation operator, constraints can be imposed to type 
              parameters so that the type parameters can only be substituted with only certain types that satisfies 
              the relation.

  @Description: Check that substitution into generic function by a not satisfying type causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

open class Base {}

open class Animal <: Base {}

class Dog <: Animal {}

func genericFunction<T>(x: T) where T <: Animal {
    if (x is Dog) {
        return 1
    }
    return 0
}

type T = Base

main() {
    var c = T()

    return genericFunction<T>(c)
}

