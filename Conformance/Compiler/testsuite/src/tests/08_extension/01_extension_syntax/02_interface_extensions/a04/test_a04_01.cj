/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a04_01

  @Level:         1

  @Assertion:   8.1.2(4) Using interface extensions for a type to implement interface I is
                equivalent to implementing interface I at type definition time, but the scope
                of use is limited by the extension import and export, see Extension Import
                and Export for details.

  @Description: Checks that interface extending is equivalent to implementing interface at type
                definition time.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

interface I {
    func foo2(): String
}

class A <: I {
    public func foo1(): String { "a" }

    public func foo2(): String { "b" }
}

class B {
    public func foo1(): String { "a" }
}

extend B <: I {
    public func foo2(): String { "b" }
}

main() {
    let a = A()
    let b = B()
    Assert.equals("a", a.foo1())
    Assert.equals("a", b.foo1())
    Assert.equals("b", a.foo2())
    Assert.equals("b", b.foo2())
}
