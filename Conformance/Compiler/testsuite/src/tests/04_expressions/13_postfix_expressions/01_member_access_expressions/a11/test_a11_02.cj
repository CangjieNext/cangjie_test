/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a11_02

  @Level:         1

  @Assertion: 4.13.1(11) When e is an expression (assuming the type of e is T), we have the following rules.

              1. When T is a reference type, e.a is mutable if a is a mutable instance member variable of T, otherwise
                 e.a is immutable.

  @Description: Check that 'e.a' is immutable when 'a' is an immutable instance member variable and type of 'e' is a
                reference type.

  @Mode: compileonly

  @Negative: yes

*/

class C {
    init() {
        x = 3
    }

    let x: Int64
}

class D {
    init() {
        c = C()
    }

    func getC() {
        return c
    }

    var c: C
}

main() {
    var d = D()
    d.getC().x = 5
}

