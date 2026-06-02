/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a38_001

  @Level:         1

  @Assertion: 6.1.2.4(38)
              override: When a function overrides another open function,
              it can be declared with an optional modifier override
              (override does not have the open semantic.
              If the function modified with override needs to be override, use open modifier it again.). 

  @Description: Check that a function overriding another one can be defined
                with or without the 'override' modifier

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

open class Open {
    public open func f1() {
        Assert.isTrue(false)
    }

    public open func f2(x: Int64) {
        Assert.isTrue(false)
    }

    public open func f3() {
        Assert.isTrue(false)
        return 1
    }

    public open func f4(x: Int64) {
        Assert.isTrue(false)
        return 2
    }

    protected open func f5() {
        Assert.isTrue(false)
    }

    protected open func f6(x: Int64) {
        Assert.isTrue(false)
    }

    protected open func f7() {
        Assert.isTrue(false)
        return 3
    }

    protected open func f8(x: Int64) {
        Assert.isTrue(false)
        return 4
    }
}

abstract class Abstract {
    public open func f1() {
        Assert.isTrue(false)
    }

    public open func f2(x: Int64) {
        Assert.isTrue(false)
    }

    public open func f3() {
        Assert.isTrue(false)
        return 5
    }

    public open func f4(x: Int64) {
        Assert.isTrue(false)
        return 6
    }

    protected open func f5() {
        Assert.isTrue(false)
    }

    protected open func f6(x: Int64) {
        Assert.isTrue(false)
    }

    protected open func f7() {
        Assert.isTrue(false)
        return 7
    }

    protected open func f8(x: Int64) {
        Assert.isTrue(false)
        return 8
    }
}

sealed abstract class Sealed {
    public open func f1() {
        Assert.isTrue(false)
    }

    public open func f2(x: Int64) {
        Assert.isTrue(false)
    }

    public open func f3() {
        Assert.isTrue(false)
        return 9
    }

    public open func f4(x: Int64) {
        Assert.isTrue(false)
        return 10
    }

    protected open func f5() {
        Assert.isTrue(false)
    }

    protected open func f6(x: Int64) {
        Assert.isTrue(false)
    }

    protected open func f7() {
        Assert.isTrue(false)
        return 11
    }

    protected open func f8(x: Int64) {
        Assert.isTrue(false)
        return 12
    }
}

// Override with the usage of the 'override' modifier
class Test1 <: Open {
    public override func f1() {}

    public override func f2(x: Int64) {}

    public override func f3() {
        return 10
    }

    public override func f4(x: Int64) {
        return 20
    }

    protected override func f5() {}

    protected override func f6(x: Int64) {}

    protected override func f7() {
        return 30
    }

    protected override func f8(x: Int64) {
        return 40
    }
}

class Test2 <: Abstract {
    public override func f1() {}

    public override func f2(x: Int64) {}

    public override func f3() {
        return 50
    }

    public override func f4(x: Int64) {
        return 60
    }

    protected override func f5() {}

    protected override func f6(x: Int64) {}

    protected override func f7() {
        return 70
    }

    protected override func f8(x: Int64) {
        return 80
    }
}

class Test3 <: Sealed {
    public override func f1() {}

    public override func f2(x: Int64) {}

    public override func f3() {
        return 90
    }

    public override func f4(x: Int64) {
        return 100
    }

    protected override func f5() {}

    protected override func f6(x: Int64) {}

    protected override func f7() {
        return 110
    }

    protected override func f8(x: Int64) {
        return 120
    }
}

// Override without the usage of the 'override' modifier
class Test4 <: Open {
    public func f1() {}

    public func f2(x: Int64) {}

    public func f3() {
        return 100
    }

    public func f4(x: Int64) {
        return 200
    }

    protected func f5() {}

    protected func f6(x: Int64) {}

    protected func f7() {
        return 300
    }

    protected func f8(x: Int64) {
        return 400
    }
}

class Test5 <: Abstract {
    public func f1() {}

    public func f2(x: Int64) {}

    public func f3() {
        return 500
    }

    public func f4(x: Int64) {
        return 600
    }

    protected func f5() {}

    protected func f6(x: Int64) {}

    protected func f7() {
        return 700
    }

    protected func f8(x: Int64) {
        return 800
    }
}

class Test6 <: Sealed {
    public func f1() {}

    public func f2(x: Int64) {}

    public func f3() {
        return 900
    }

    public func f4(x: Int64) {
        return 1000
    }

    protected func f5() {}

    protected func f6(x: Int64) {}

    protected func f7() {
        return 1100
    }

    protected func f8(x: Int64) {
        return 1200
    }
}

main() {
    let case1 = Test1()
    Assert.isTrue(case1.f1() is Unit)
    Assert.isTrue(case1.f2(1) is Unit)
    Assert.equals(10, case1.f3())
    Assert.equals(20, case1.f4(1))
    Assert.isTrue(case1.f5() is Unit)
    Assert.isTrue(case1.f6(1) is Unit)
    Assert.equals(30, case1.f7())
    Assert.equals(40, case1.f8(1))

    let case2 = Test2()
    Assert.isTrue(case2.f1() is Unit)
    Assert.isTrue(case2.f2(1) is Unit)
    Assert.equals(50, case2.f3())
    Assert.equals(60, case2.f4(1))
    Assert.isTrue(case2.f5() is Unit)
    Assert.isTrue(case2.f6(1) is Unit)
    Assert.equals(70, case2.f7())
    Assert.equals(80, case2.f8(1))

    let case3 = Test3()
    Assert.isTrue(case3.f1() is Unit)
    Assert.isTrue(case3.f2(1) is Unit)
    Assert.equals(90, case3.f3())
    Assert.equals(100, case3.f4(1))
    Assert.isTrue(case3.f5() is Unit)
    Assert.isTrue(case3.f6(1) is Unit)
    Assert.equals(110, case3.f7())
    Assert.equals(120, case3.f8(1))

    let case4 = Test4()
    Assert.isTrue(case4.f1() is Unit)
    Assert.isTrue(case4.f2(1) is Unit)
    Assert.equals(100, case4.f3())
    Assert.equals(200, case4.f4(1))
    Assert.isTrue(case4.f5() is Unit)
    Assert.isTrue(case4.f6(1) is Unit)
    Assert.equals(300, case4.f7())
    Assert.equals(400, case4.f8(1))

    let case5 = Test5()
    Assert.isTrue(case5.f1() is Unit)
    Assert.isTrue(case5.f2(1) is Unit)
    Assert.equals(500, case5.f3())
    Assert.equals(600, case5.f4(1))
    Assert.isTrue(case5.f5() is Unit)
    Assert.isTrue(case5.f6(1) is Unit)
    Assert.equals(700, case5.f7())
    Assert.equals(800, case5.f8(1))

    let case6 = Test6()
    Assert.isTrue(case6.f1() is Unit)
    Assert.isTrue(case6.f2(1) is Unit)
    Assert.equals(900, case6.f3())
    Assert.equals(1000, case6.f4(1))
    Assert.isTrue(case6.f5() is Unit)
    Assert.isTrue(case6.f6(1) is Unit)
    Assert.equals(1100, case6.f7())
    Assert.equals(1200, case6.f8(1))
}