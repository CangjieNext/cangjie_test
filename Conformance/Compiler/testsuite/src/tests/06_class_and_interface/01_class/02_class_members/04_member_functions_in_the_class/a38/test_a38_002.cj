/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a38_002

  @Level:         1

  @Assertion: 6.1.2.4(38)
              override: When a function overrides another open function,
              it can be declared with an optional modifier override
              (override does not have the open semantic.
              If the function modified with override needs to be override, use open modifier it again.). 

  @Description: Check that a function implementing an abstract function
                can be defined with the 'override' modifier

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

abstract class Abstract {
    public func f1(): Unit

    public func f2(x: Int64): Unit

    public func f3(): Int64

    public func f4(x: Int64): Int64

    protected func f5(): Unit

    protected func f6(x: Int64): Unit

    protected func f7(): Int64

    protected func f8(x: Int64): Int64
}

class Test1 <: Abstract {
    public override func f1() {}

    public override func f2(x: Int64) {}

    public override func f3() {
        return 1
    }

    public override func f4(x: Int64) {
        return 2
    }

    protected override func f5() {}

    protected override func f6(x: Int64) {}

    protected override func f7() {
        return 3
    }

    protected override func f8(x: Int64) {
        return 4
    }
}

class Test2 <: Abstract {
    public func f1() {}

    public func f2(x: Int64) {}

    public func f3() {
        return 10
    }

    public func f4(x: Int64) {
        return 20
    }

    protected func f5() {}

    protected func f6(x: Int64) {}

    protected func f7() {
        return 30
    }

    protected func f8(x: Int64) {
        return 40
    }
}

main() {
    let tst1 = Test1()
    Assert.isTrue(tst1.f1() is Unit)
    Assert.isTrue(tst1.f2(1) is Unit)
    Assert.equals(1, tst1.f3())
    Assert.equals(2, tst1.f4(1))
    Assert.isTrue(tst1.f5() is Unit)
    Assert.isTrue(tst1.f6(1) is Unit)
    Assert.equals(3, tst1.f7())
    Assert.equals(4, tst1.f8(1))

    let tst2 = Test2()
    Assert.isTrue(tst2.f1() is Unit)
    Assert.isTrue(tst2.f2(1) is Unit)
    Assert.equals(10, tst2.f3())
    Assert.equals(20, tst2.f4(1))
    Assert.isTrue(tst2.f5() is Unit)
    Assert.isTrue(tst2.f6(1) is Unit)
    Assert.equals(30, tst2.f7())
    Assert.equals(40, tst2.f8(1))
}