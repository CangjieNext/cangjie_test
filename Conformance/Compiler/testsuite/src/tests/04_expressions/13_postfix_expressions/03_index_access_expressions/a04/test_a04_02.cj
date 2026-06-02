/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_03_a04_02

  @Level:         1

  @Assertion: 4.13.3(4) For the index access expression e[a] (assuming that e is of type T),
              we have the following rules.
              2. When T is not a tuple type, e[a] is mutable if T overloads the set form of the operator [] (see
                 Operators that can be Overloaded), otherwise e[a] is immutable.

  @Description: Check that 'e[a]' is mutable when type of 'e' overloads the set form of the operator [].

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    init() {
        x = "Cao Xueqin"
    }

    operator func [](index: Int64, value!: String): Unit {
        x = value
    }

    var x: String
}

main() {
    let c = C()
    Assert.equals("Cao Xueqin", c.x)

    c[0] = "Shi Nai'an"
    Assert.equals("Shi Nai'an", c.x)
}

