/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a02_05

  @Level:         1

  @Assertion: 9.2(2) <: is a binary relation. By using this relation operator, constraints can be imposed to type 
              parameters so that the type parameters can only be substituted with only certain types that satisfies 
              the relation.

  @Description: Check that substitution into generic enum by a not satisfying type causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

open class Base {}

open class Animal<: Base {}

class Dog <: Animal {}

enum GenericEnum<T> where T <: Animal {
    | Data(T)
    | Code(Int64)
}

type T = Base

main() {
    var c = T()

    return match (GenericEnum<T>.Data(c)) {
        case Data(x) => 1
        case Code(x) => 0
    }
}

