/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a37_01

  @Level:         1

  @Assertion: 6.1.2.4(37)
              // case 1
              open class C1 { // In this case, the 'open' modifier before 'class C1' is required.
                public open func f() {}
              }
              class C2 <: C1 {
                public override func f() {}
              }
              // case 2
              open class A {
                public open func f() {}
              }
              open class B <: A {}
              class C <: B {
                public override func f() {} // ok
              }
              // case 3
              interface I {
                func f() {}
              }
              open class Base <: I {} // The function f Inherits the open modifier.
              class Sub <: Base {
                public override func f() {} // ok
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

// case 1
open class C1 { // In this case, the 'open' modifier before 'class C1' is required.
    public open func f() {}
}
class C2 <: C1 {
    public override func f() {}
}
// case 2
open class A {
    public open func f() {}
}
open class B <: A {}
class C <: B {
    public override func f() {} // ok
}
// case 3
interface I {
    func f() {}
}
open class Base <: I {} // The function f Inherits the open modifier.
class Sub <: Base {
    public override func f() {} // ok
}

main() {
    Assert.isTrue(C1().f() is Unit)
    Assert.isTrue(C2().f() is Unit)
    Assert.isTrue(A().f() is Unit)
    Assert.isTrue(B().f() is Unit)
    Assert.isTrue(C().f() is Unit)
    Assert.isTrue(Base().f() is Unit)
    Assert.isTrue(Sub().f() is Unit)
}