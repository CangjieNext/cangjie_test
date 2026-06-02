/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a07_07

  @Level:         1

  @Assertion: 9.2(7) A type variable can be constrained by multiple upperbound.

  @Description: Check that substituted type not conforming to all constraints in generic enum declaration causes
                a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

interface Printable {}

open class Animal {}

class Dog <: Animal {}

enum GenericEnum<T> where T <: Animal & Printable {
    | Data(T)
    | Code(Int64)
}

main() {
    var a = Dog()

    let value = match (GenericEnum<Dog>.Data(a)) {
        case Data(x) => 1
        case Code(x) => 0
    }
}

