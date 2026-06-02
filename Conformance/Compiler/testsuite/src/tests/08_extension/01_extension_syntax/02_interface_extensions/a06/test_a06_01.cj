/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a06_01

  @Level:         1

  @Assertion:   8.1.2(6) We can implement multiple interfaces in the same extension at the
                same time, with multiple interfaces separated by &, and the order of the
                interfaces is not sequential.

  @Description: Checks different order of interfaces.

  @Mode:        run
  @Negative:    no
  @Structure:   single


*/

import utils.assert.Assert

interface I1 {
    func foo1(): Bool
}

interface I2 {
    func foo2(): Bool
}

interface I3 {
    func foo3(): Bool
}

class Foo1 {}
class Foo2 {}
class Foo3 {}

extend Foo1 <: I1 & I2 & I3 {
    public func foo1(): Bool { true }
    public func foo2(): Bool { true }
    public func foo3(): Bool { true }
}

extend Foo2 <: I3 & I2 & I1 {
    public func foo1(): Bool { true }
    public func foo2(): Bool { true }
    public func foo3(): Bool { true }
}

extend Foo3 <: I2 & I1 & I3 {
    public func foo1(): Bool { true }
    public func foo2(): Bool { true }
    public func foo3(): Bool { true }
}

main() {
    let a1 = Foo1()
    let a2 = Foo2()
    let a3 = Foo3()
    Assert.isTrue(a1.foo1())
    Assert.isTrue(a1.foo2())
    Assert.isTrue(a1.foo3())
    Assert.isTrue(a2.foo1())
    Assert.isTrue(a2.foo2())
    Assert.isTrue(a2.foo3())
    Assert.isTrue(a3.foo1())
    Assert.isTrue(a3.foo2())
    Assert.isTrue(a3.foo3())
}
