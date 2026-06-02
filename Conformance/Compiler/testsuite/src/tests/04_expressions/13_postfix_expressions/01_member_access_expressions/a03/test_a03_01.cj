/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a03_01

  @Level:         1

  @Assertion: 4.13.1(3) For the member-access expression is T.a, T can be represented as a specific instance 
              or type name, which we called as the subject of a member access expression, and a denotes
              the name of the member

  @Description: Check usage of member access expressions T.a where T is either instance or type name.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

struct S {
    S(var a!: Int64) {}
}

class C {
    static var a = 35
}

main() {
    // T is an instance.
    let s = S(a: 42)
    let x = s.a
    Assert.equals(42, x)

    // T is a type name.
    let y = C.a
    Assert.equals(35, y)
}

