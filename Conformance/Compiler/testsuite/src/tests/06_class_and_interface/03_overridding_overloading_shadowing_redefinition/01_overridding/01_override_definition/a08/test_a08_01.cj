/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a08_01

  @Level:         1

  @Assertion: 6.3.1.1(8)
              Example:
              • In the following example, Function f in C2 overwrites f in Iand C1 since they have the same parameter
              type and return type.
              • Function f1 in C2 overwrites f1 in the C2 since the return type of f1 in C1 is Father, and the return
              type of f1 in C2 is Child.
              open class Father {}
              class Child <: Father {}
              open class C1 {
                public open func f() {}
                public open func f1(): Father { Father() }
              }
              interface I {
                func f() {}
              }
              class C2 <: C1 & I {
                public override func f() {} // OK.
                public override func f1(): Child { Child() } // OK.
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
    public open func f() {}
    public open func f1(): Father { Father() }
}

interface I {
    func f() {}
}

class C2 <: C1 & I {
    public override func f() {} // OK.
    public override func f1(): Child { Child() } // OK.
}

main() {
    let c1 = C1()
    Assert.isTrue(c1.f() is Unit)
    Assert.isTrue(c1.f1() is Father)

    let c2 = C2()
    Assert.isTrue(c2.f() is Unit)
    Assert.isTrue(c2.f1() is Child)
}