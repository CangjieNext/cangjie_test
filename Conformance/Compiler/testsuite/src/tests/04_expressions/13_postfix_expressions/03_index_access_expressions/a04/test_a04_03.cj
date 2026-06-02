/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_03_a04_03

  @Level:         1

  @Assertion: 4.13.3(4) For the index access expression e[a] (assuming that e is of type T),
              we have the following rules.
              2. When T is not a tuple type, e[a] is mutable if T overloads the set form of the operator [] (see
                 Operators that can be Overloaded), otherwise e[a] is immutable.

  @Description: Check that 'e[a]' is immutable when type of 'e' does not overload the set form of the operator [].

  @Mode: compileonly

  @Negative: yes

*/

class C {
    init() {
        x = "Cao Xueqin"
    }

    operator func [](index: Int64): String {
        return x
    }

    var x: String
}

main() {
    let c = C()
    c[0] = "Shi Nai'an"
}

