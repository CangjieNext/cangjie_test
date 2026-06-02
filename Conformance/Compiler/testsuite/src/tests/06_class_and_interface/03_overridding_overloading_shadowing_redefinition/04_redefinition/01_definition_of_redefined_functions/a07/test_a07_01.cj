/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_04_01_a07_01

  @Level:         1

  @Assertion: 6.3.4.1(7)
              Example:
              • In the following example, Function f in C2 redefines f in Iand C1
              since they have the same parameter type and return type.
              • Function f1 in C2 redefines f1 in the C2 since the return type of f1 in C1 is Father,
              and the return type of f1 in C2 is Child.
              open class Father {}
              class Child <: Father {}
              open class C1 {
                public static func f() {}
                public static func f1(): Father { Father() }
              }
              interface I {
                static func f() {}
              }
              class C2 <: C1 & I {
                public redef static func f() {} // OK.
                public redef static func f1(): Child { Child() } // OK.
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

open class Father {}
class Child <: Father {}

open class C1 {
    public static func f() {}
    public static func f1(): Father { Father() }
}

interface I {
    static func f() {}
}

class C2 <: C1 & I {
    public redef static func f() {} // OK.
    public redef static func f1(): Child { Child() } // OK.
}

main() {
    Assert.isTrue(C2.f() is Unit)
    Assert.isTrue(C2.f1() is Child)
}